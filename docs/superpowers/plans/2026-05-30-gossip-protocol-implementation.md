# The Gossip Protocol (SyncService) Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement the Gossip Protocol for background message synchronization between peers using a three-way handshake.

**Architecture:** A dedicated `SyncService` manages the handshake generation, comparison, and packet exchange logic, utilizing Isar for local storage and `DiscoveryRepository` for peer-to-peer communication.

**Tech Stack:** Flutter, Dart, Isar, GetIt, Bloc.

---

### Task 1: Create SyncHandshake Model

**Files:**
- Create: `swiftchat/lib/features/chat/data/models/sync_handshake.dart`
- Test: `swiftchat/test/features/chat/data/models/sync_handshake_test.dart`

- [ ] **Step 1: Write unit tests for SyncHandshake**
- [ ] **Step 2: Implement SyncHandshake model with fromJson/toJson**

### Task 2: Implement SyncService

**Files:**
- Create: `swiftchat/lib/features/chat/data/services/sync_service.dart`
- Test: `swiftchat/test/features/chat/data/services/sync_service_test.dart`

- [ ] **Step 1: Implement `SyncService` class**
- [ ] **Step 2: Implement `generateHandshake()`**
- [ ] **Step 3: Implement `compareHandshake()`**
- [ ] **Step 4: Implement `processSyncRequest()`**
- [ ] **Step 5: Implement `handleHandshake()` to respond with request**
- [ ] **Step 6: Implement `sendHandshake()` to initiate sync**

### Task 3: Update Service Locator (DI)

**Files:**
- Modify: `swiftchat/lib/core/di/service_locator.dart`

- [ ] **Step 1: Register `SyncService` in `service_locator.dart`**

### Task 4: Integrate with DiscoveryCubit

**Files:**
- Modify: `swiftchat/lib/features/discovery/presentation/bloc/discovery_cubit.dart`

- [ ] **Step 1: Inject `SyncService` into `DiscoveryCubit`**
- [ ] **Step 2: Update `payloadStream` listener to route sync payloads**
- [ ] **Step 3: Trigger `sendHandshake` when a peer is connected (after handshake service)**

### Task 5: Verification

- [ ] **Step 1: Run all tests**
- [ ] **Step 2: Verify static analysis**
