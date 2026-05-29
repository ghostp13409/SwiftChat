# Phase 1: Secure Foundation

**Goal:** Establish the core ability for two devices to discover each other, perform a secure handshake, and exchange a direct encrypted message.

## Requirements
- Android and iOS must be able to discover each other.
- Connections must be peer-to-peer (no router required).
- Handshake must establish a persistent shared secret using ECDH.
- Profiles must be stored locally only.

## Technical Tasks

### 1.1 Project Setup & Infrastructure
- [ ] Add `nearby_connections` dependency.
- [ ] Add `cryptography` dependency (for ECDH/AES).
- [ ] Add `isar` + `isar_generator` (for profile/key storage).
- [ ] Configure Android permissions (Location, Bluetooth, Wi-Fi State).
- [ ] Configure iOS permissions (Nearby Interaction, Bluetooth).

### 1.2 Profile Management
- [ ] Create `Profile` model (Username, Bio, Topics, Public Key).
- [ ] Build "Setup Profile" screen.
- [ ] Implement local storage for the user's own identity.

### 1.3 Discovery & Connection
- [ ] Implement `DiscoveryService` to toggle Advertising/Discovery.
- [ ] Implement connection request/accept logic.
- [ ] Handle connection lifecycle (onConnected, onDisconnected).

### 1.4 Secure Handshake (E2EE)
- [ ] Generate ephemeral ECDH keys on connection.
- [ ] Exchange public keys via `nearby_connections` payload.
- [ ] Derive shared secret and store it for the Peer ID.
- [ ] Implement `EncryptionService` (Encrypt/Decrypt helpers).

### 1.5 Basic Messaging
- [ ] Create simple "Direct Chat" UI for testing.
- [ ] Send and receive encrypted string payloads.
- [ ] Visual confirmation of "Secure Link Established".

## Success Criteria
1. Run app on Device A and Device B.
2. Device A sees Device B.
3. They connect and exchange keys.
4. Device A sends "Hi", Device B receives "Hi" (and vice versa).
5. Inspecting the over-the-air payload shows encrypted gibberish.
