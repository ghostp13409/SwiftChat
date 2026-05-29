# Phase 2: Mesh & Gossip Engine Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transform direct messaging into a persistent, relay-capable mesh network using Isar for storage and a custom gossip protocol for synchronization.

**Architecture:** Clean Architecture with a focus on a decoupled Data layer. Migrating from Drift to Isar. Implementing a `SyncManager` service for gossip logic.

**Tech Stack:** Flutter, Isar, Nearby Connections, flutter_bloc, get_it.

---

### Task 1: Setup Isar and Collections

**Files:**
- Create: `swiftchat/lib/core/database/isar_database.dart`
- Create: `swiftchat/lib/core/database/collections/profile_collection.dart`
- Create: `swiftchat/lib/core/database/collections/message_collection.dart`
- Create: `swiftchat/lib/core/database/collections/mesh_packet_collection.dart`
- Modify: `swiftchat/pubspec.yaml`

- [ ] **Step 1: Add Isar dependencies**

Run: `flutter pub add isar isar_flutter_libs path_provider && flutter pub add dev:isar_generator build_runner`

- [ ] **Step 2: Create Profile Collection**

```dart
import 'isar';

@collection
class ProfileCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String peerId;
  
  late String username;
  String? bio;
  String? photoPath;
  late String publicKey;
  late List<String> topics;
  late bool isMe;
}
```

- [ ] **Step 3: Create Message Collection**

```dart
import 'isar';

enum MessageStatus { pending, sent, delivered }

@collection
class MessageCollection {
  Id id = Isar.autoIncrement;

  @Index()
  late String messageId; // Unique UUID
  
  @Index()
  late String chatPartnerId;
  
  late String senderId;
  late String recipientId;
  late String content;
  
  @Index()
  late DateTime timestamp;
  
  @enumerated
  late MessageStatus status;
  
  late bool isDirect;
}
```

- [ ] **Step 4: Create MeshPacket Collection**

```dart
import 'isar';

@collection
class MeshPacketCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String messageHash;
  
  @Index()
  late String recipientId;
  
  late String payload; // Encrypted JSON
  
  @Index()
  late DateTime ttl;
  
  late DateTime createdAt;
}
```

- [ ] **Step 5: Initialize Isar Database**

```dart
import 'isar';
import 'path_provider';

class IsarDatabase {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ProfileCollectionSchema, MessageCollectionSchema, MeshPacketCollectionSchema],
      directory: dir.path,
    );
  }
}
```

- [ ] **Step 6: Run Code Generation**

Run: `dart run build_runner build --delete-conflicting-outputs`

---

### Task 2: Data Migration (Drift to Isar)

**Files:**
- Create: `swiftchat/lib/core/database/migration_service.dart`
- Modify: `swiftchat/lib/main.dart`

- [ ] **Step 1: Implement Migration Logic**

```dart
class MigrationService {
  final AppDatabase driftDb;
  final Isar isar;

  MigrationService(this.driftDb, this.isar);

  Future<void> migrate() async {
    final profiles = await driftDb.select(driftDb.profiles).get();
    if (profiles.isEmpty) return;

    await isar.writeTxn(() async {
      for (final p in profiles) {
        final collection = ProfileCollection()
          ..peerId = p.peerId
          ..username = p.username
          ..bio = p.bio
          ..photoPath = p.photoPath
          ..publicKey = p.publicKey
          ..topics = p.topics
          ..isMe = p.isMe;
        await isar.profileCollections.put(collection);
      }
    });
    // Optional: Delete Drift DB file after success
  }
}
```

- [ ] **Step 2: Trigger migration on app start**

Modify `main.dart` to initialize Isar and run migration before removing Drift.

---

### Task 3: Implement MessageRepository (Isar)

**Files:**
- Create: `swiftchat/lib/features/chat/data/repositories/message_repository_impl.dart`
- Modify: `swiftchat/lib/features/chat/domain/repositories/message_repository.dart`

- [ ] **Step 1: Define MessageRepository interface**
- [ ] **Step 2: Implement Isar version of MessageRepository**
- [ ] **Step 3: Update Service Locator (GetIt)**

---

### Task 4: The Gossip Protocol (SyncService)

**Files:**
- Create: `swiftchat/lib/features/chat/data/services/sync_service.dart`
- Create: `swiftchat/lib/features/chat/data/models/sync_handshake.dart`

- [ ] **Step 1: Create SyncHandshake model** (List of IDs + Timestamps)
- [ ] **Step 2: Implement Handshake Logic in SyncService**
- [ ] **Step 3: Integrate with DiscoveryRepository for payload exchange**

---

### Task 5: Smart Sync Manager & Background Cleanup

**Files:**
- Create: `swiftchat/lib/core/utils/sync_manager.dart`
- Create: `swiftchat/lib/core/utils/cleanup_worker.dart`

- [ ] **Step 1: Implement SyncManager with Scan/Cooldown logic**
- [ ] **Step 2: Implement CleanupWorker for TTL and 100MB limit**
- [ ] **Step 3: Register and start services in main.dart**

---

### Task 6: UI Update (Status & Relay Count)

**Files:**
- Modify: `swiftchat/lib/features/chat/presentation/widgets/message_bubble.dart`
- Modify: `swiftchat/lib/features/chat/presentation/bloc/chat_bloc.dart`

- [ ] **Step 1: Update Bloc to handle new message statuses**
- [ ] **Step 2: Update UI to show WhatsApp-style checkmarks**
- [ ] **Step 3: Add "Message Info" dialog with relay count**
