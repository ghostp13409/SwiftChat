# Phase 2: Mesh & Gossip Engine

**Goal:** Transform direct messaging into a persistent, relay-capable mesh network where messages can be stored and forwarded.

## Requirements
- Messages must be saved to a local database.
- Messages must have an expiry time (TTL).
- Devices must be able to "Relay" messages meant for other people.
- Auto-sync must occur whenever two devices meet.

## Technical Tasks

### 2.1 Persistent Storage (Isar)
- [ ] Create `Message` schema (Sender, Recipient, Content, Timestamp, Expiry).
- [ ] Create `MeshPacket` schema for relaying data.
- [ ] Implement `MessageRepository` for CRUD operations.

### 2.2 The Gossip Protocol
- [ ] Implement `SyncService`.
- [ ] Define "Sync Handshake" payload (List of message hashes + timestamps).
- [ ] Logic to compare local DB with peer's DB and identify "Gaps".
- [ ] Implement "Relay" logic: Storing and passing along packets where `recipientID != myID`.

### 2.3 Time-To-Live (TTL) & Cleanup
- [ ] Implement background worker/timer for deletion.
- [ ] Support user-configurable expiry (1h, 4h, 8h, 24h, 1w, 4w).
- [ ] Implement "Manual Delete" for chats.
- [ ] Storage Limit: Automatically purge oldest "Relay" packets if cache exceeds 100MB.

### 2.4 Offline Resilience
- [ ] "Pending" status for messages.
- [ ] Automatic retry/sync when a known peer comes back into range.
- [ ] Visual indicator in Chat UI for "Sent", "Relayed", and "Delivered".

## Success Criteria
1. Send message from A to B while B is offline.
2. Device A meets Device C. Message is passed to C.
3. Device C meets Device B. Message is passed to B.
4. Device B receives the message.
5. Message is automatically deleted after the set time.
