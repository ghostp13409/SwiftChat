# SwiftChat Technical Architecture

This document defines the technical implementation of the SwiftChat P2P mesh network.

## 1. Network Layer: Hybrid Gossip Mesh

### 1.1 Transport (Nearby Connections)
- **Framework**: Google `nearby_connections` (cross-platform).
- **Strategy**: `P2P_CLUSTER`.
- **Logic**: 
    - Bluetooth Low Energy (BLE) for discovery.
    - Wi-Fi Direct or Hotspot for high-speed payload transfer.
    - Devices act as both **Advertiser** and **Discoverer** to form a cluster.

### 1.2 Gossip Protocol
To ensure messages travel through the mesh, we implement an **Anti-Entropy Gossip Protocol**:
- **Sequence Numbers**: Every device maintains a monotonic counter.
- **Sync Log**: A list of `(MessageHash, SequenceNumber, Timestamp)` known to the device.
- **Handshake**: When Device A and B connect:
    1. Exchange Sync Log summaries.
    2. Identify missing messages.
    3. Push/Pull missing encrypted packets.

## 2. Security: End-to-End Encryption (E2EE)

### 2.1 Key Exchange (Diffie-Hellman)
- **Algorithm**: Elliptic Curve Diffie-Hellman (ECDH).
- **Process**:
    1. Generate ephemeral KeyPair on handshake.
    2. Exchange Public Keys.
    3. Derive a Shared Secret.
    4. Save derived keys locally for "Persistent Sessions" associated with the Peer ID.

### 2.2 Encryption & Integrity
- **Symmetric Encryption**: AES-256-GCM for message content.
- **Signatures**: Ed25519 to verify the original sender of a relayed message.
- **Metadata**: Only the "Next Hop" and "Expiry" are unencrypted; sender/recipient IDs and content are encrypted.

## 3. Data Layer: Offline-First Storage

### 3.1 Local Database (Isar)
- **Collections**:
    - `Peers`: ID, Username, Photo, Bio, Public Key, Status.
    - `Messages`: ID, ChatID, SenderID, Content (Encrypted), Timestamp, Expiry, Status.
    - `Groups`: ID, Name, Topic, Members, IsPrivate.
    - `MeshCache`: Relayed messages waiting for a recipient.

### 3.2 Cleanup (TTL)
- **User Messages**: Expire based on settings (1h - 4w).
- **Relay Cache**: Expire aggressively (1h) or after 3 successful transfers.

## 4. Privacy: Contact Discovery
- **Hashing**: Contact phone numbers/emails are hashed with SHA-256 before broadcasting.
- **Matching**: Nearby devices check broadcasts against local "Contact Hashes" to determine visibility.
