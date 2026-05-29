# Phase 2 Design: Mesh & Gossip Engine

**Date:** 2026-05-29
**Status:** Approved
**Topic:** Mesh Networking, Persistent Storage, Gossip Protocol

## 1. Executive Summary
Phase 2 transforms SwiftChat from a direct P2P chat app into an opportunistic mesh network. It introduces local persistence, a gossip-based synchronization protocol, and message relay capabilities.

## 2. Architecture & Components

### 2.1 Storage Layer (Isar Migration)
We are migrating from Drift (SQLite) to **Isar** (NoSQL) for better performance and a more natural fit for the "Mesh Packet" data structure.

**Collections:**
- `Profile`: id (peerId), username, bio, photoPath, publicKey, isMe.
- `Message`: id, chatPartnerId, senderId, content, timestamp, status (Pending, Sent, Delivered), isDirect.
- `MeshPacket`: messageHash, recipientId, payload (Encrypted JSON), ttl (DateTime), createdAt.

### 2.2 Gossip Protocol
Two devices meeting will perform a "Summary Exchange" to identify missing data without re-sending entire messages.

**Handshake Flow:**
1. **Advertise**: A sends a list of `(messageId, timestamp)` hashes to B.
2. **Compare**: B checks which `messageIds` are missing from its local Isar DB.
3. **Request**: B sends a list of missing `ids` to A.
4. **Fulfill**: A sends the full `MeshPacket` data for the requested IDs.

### 2.3 Smart Sync Strategy
To preserve battery while maintaining mesh connectivity, the `SyncManager` will follow these rules:
- **Scan Interval**: 3 minutes.
- **Scan Duration**: 30 seconds.
- **Peer Cooldown**: Once a successful sync occurs with Peer X, they are ignored for the next 15 minutes unless a direct chat is initiated.

### 2.4 TTL & Cleanup
- **Default TTL**: 24 Hours.
- **Relay Cache Limit**: 100MB (LRU eviction - Least Recently Used).
- **Cleanup Task**: A background timer runs every 30 minutes to purge expired records.

## 3. UI/UX Strategy
- **Simplicity**: Users only see "Sent" (1 check) and "Delivered" (2 checks).
- **Delivery Receipts**: When a device receives a message where `recipientId == myId`, it generates a "Delivery Receipt" packet that gossips back to the sender.
- **Message Info**: (Optional/Phase 3) A "Message Details" view will show the relay count for transparency.

## 4. Testing & Validation
- **Gossip Simulation**: Unit tests using mock repositories to verify that a message propagates from A -> B -> C.
- **Cleanup Tests**: Verify that records disappear after the TTL expires.
- **Migration Tests**: Ensure existing profiles are moved from Drift to Isar correctly.
