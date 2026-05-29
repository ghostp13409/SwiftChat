# Smart Sync Manager & Background Cleanup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement `CleanupWorker` for database maintenance and integrate it along with `SyncManager` into the app startup.

**Architecture:** `CleanupWorker` and `SyncManager` are utility classes managed by `GetIt` and initialized in `main.dart`. They use `Timer.periodic` for background-like execution while the app is running.

**Tech Stack:** Flutter, Isar, GetIt.

---

### Task 1: CleanupWorker Implementation

**Files:**
- Create: `swiftchat/lib/core/utils/cleanup_worker.dart`
- Test: `swiftchat/test/core/utils/cleanup_worker_test.dart`

- [ ] **Step 1: Create CleanupWorker class**
```dart
import 'dart:async';
import 'dart:developer' as developer;
import 'package:isar/isar.dart';
import '../database/collections/message_collection.dart';
import '../database/collections/mesh_packet_collection.dart';

class CleanupWorker {
  CleanupWorker(this.isar);

  final Isar isar;
  Timer? _timer;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 30), (timer) {
      _runCleanup();
    });
    // Run once on start
    _runCleanup();
    developer.log('CleanupWorker started', name: 'CleanupWorker');
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    developer.log('CleanupWorker stopped', name: 'CleanupWorker');
  }

  Future<void> _runCleanup() async {
    try {
      final now = DateTime.now();
      
      await isar.writeTxn(() async {
        // 1. Delete expired messages
        final expiredMessagesCount = await isar.messageCollections
            .filter()
            .ttlLessThan(now)
            .deleteAll();
        
        // 2. Delete expired mesh packets
        final expiredPacketsCount = await isar.meshPacketCollections
            .filter()
            .ttlLessThan(now)
            .deleteAll();

        if (expiredMessagesCount > 0 || expiredPacketsCount > 0) {
          developer.log(
            'Deleted $expiredMessagesCount expired messages and $expiredPacketsCount expired packets',
            name: 'CleanupWorker',
          );
        }

        // 3. Enforce MeshPacketCollection limit (2000 records, FIFO)
        final packetCount = await isar.meshPacketCollections.count();
        if (packetCount > 2000) {
          final toDelete = packetCount - 2000;
          final oldestPackets = await isar.meshPacketCollections
              .where()
              .sortByCreatedAt()
              .limit(toDelete)
              .findAll();
          
          final idsToDelete = oldestPackets.map((e) => e.id).toList();
          await isar.meshPacketCollections.deleteAll(idsToDelete);
          
          developer.log(
            'Enforced limit: Deleted $toDelete oldest mesh packets',
            name: 'CleanupWorker',
          );
        }
      });
    } catch (e, stackTrace) {
      developer.log(
        'Cleanup failed',
        name: 'CleanupWorker',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
```

- [ ] **Step 2: Commit CleanupWorker**
```bash
git add swiftchat/lib/core/utils/cleanup_worker.dart
git commit -m "feat: implement CleanupWorker for TTL and capacity enforcement"
```

### Task 2: Dependency Injection Registration

**Files:**
- Modify: `swiftchat/lib/core/di/service_locator.dart`

- [ ] **Step 1: Register SyncManager and CleanupWorker**
```dart
// Add imports
import '../../core/utils/sync_manager.dart';
import '../../core/utils/cleanup_worker.dart';

// Inside init() function, at the end of Core section
  sl.registerLazySingleton(() => SyncManager(
    discoveryCubit: sl(),
    profileCubit: sl(),
  ));
  
  sl.registerLazySingleton(() => CleanupWorker(sl()));
```

- [ ] **Step 2: Commit DI changes**
```bash
git add swiftchat/lib/core/di/service_locator.dart
git commit -m "refactor: register SyncManager and CleanupWorker in service locator"
```

### Task 3: Startup Integration

**Files:**
- Modify: `swiftchat/lib/main.dart`

- [ ] **Step 1: Initialize and start managers in main()**
```dart
// Add imports
import 'core/utils/sync_manager.dart';
import 'core/utils/cleanup_worker.dart';

// Inside main() function, after migration
  // Start Background Services
  di.sl<SyncManager>().start();
  di.sl<CleanupWorker>().start();
```

- [ ] **Step 2: Commit Startup changes**
```bash
git add swiftchat/lib/main.dart
git commit -m "feat: start SyncManager and CleanupWorker on app launch"
```

### Task 4: Verification

- [ ] **Step 1: Run static analysis**
Run: `flutter analyze`
Expected: No errors related to the new changes.

- [ ] **Step 2: Run tests (optional/mocked if possible)**
Run: `flutter test`
Expected: All existing tests pass.
