# Spec: Smart Sync Manager & Background Cleanup

## 1. Overview
Implement a `CleanupWorker` to manage database growth and ensure expired data is removed. Integrate `SyncManager` and `CleanupWorker` into the application's lifecycle.

## 2. Components

### 2.1 CleanupWorker
- **Path**: `swiftchat/lib/core/utils/cleanup_worker.dart`
- **Dependencies**: `Isar`
- **Schedule**: Runs every 30 minutes.
- **Operations**:
    - **TTL Cleanup**: 
        - Remove `MessageCollection` records where `ttl < DateTime.now()`.
        - Remove `MeshPacketCollection` records where `ttl < DateTime.now()`.
    - **Capacity Limit**:
        - Maintain `MeshPacketCollection` record count <= 2000.
        - If count > 2000, remove oldest records (FIFO based on `createdAt`).

### 2.2 SyncManager Integration
- `SyncManager` is already implemented.
- It needs to be registered in `service_locator.dart`.
- It needs to be started in `main.dart`.

## 3. Implementation Plan

### Phase 1: CleanupWorker Implementation
- Create `CleanupWorker` class.
- Implement `_runCleanup()` with Isar transactions.
- Use `Timer.periodic`.

### Phase 2: Dependency Injection
- Update `service_locator.dart` to register `SyncManager` and `CleanupWorker`.
- `SyncManager` requires `DiscoveryCubit` and `ProfileCubit`.

### Phase 3: Startup Integration
- Update `main.dart` to:
    - Get `SyncManager` and `CleanupWorker` from `GetIt`.
    - Call `.start()` on both.
- Ensure they are stopped if needed (though `main` usually runs for the app's lifetime).

## 4. Testing Strategy
- **Unit Tests**:
    - Test `CleanupWorker` logic by mocking `Isar`.
    - Verify TTL cleanup deletes expected records.
    - Verify record limit enforcement deletes oldest records.
- **Integration Tests**:
    - Ensure both managers start correctly in the app.
