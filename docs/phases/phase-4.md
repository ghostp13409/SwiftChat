# Phase 4: Social & Media

**Goal:** Add rich communication features including groups, topic-based discovery, and file sharing.

## Requirements
- Public and Private Groups.
- Topic matching (highlighting shared interests).
- Image and file sharing over the mesh.
- Persistent group history (syncing through any member).

## Technical Tasks

### 4.1 Group Chat Implementation
- [ ] Create `Group` model and database schema.
- [ ] "Create Group" flow (Set Name, Topic, Visibility).
- [ ] Group Handshake: Exchanging Group Keys (Shared Secret for the room).
- [ ] Logic for "Public" (broadcasted) vs "Private" (invite-only).

### 4.2 Topic Matching
- [ ] System to compare user topics with nearby peers/groups.
- [ ] Visual "Highlight" or "Match Score" in the UI.
- [ ] "Topic-Based Rooms" auto-discovery.

### 4.3 Media Sharing
- [ ] Implement file picking and thumbnail generation.
- [ ] "Payload Transfer" logic for large files using Wi-Fi Direct.
- [ ] Thumbnail sync via Gossip (for previews).
- [ ] Auto-delete files when the message expires.

### 4.4 Group Sync
- [ ] Implement "Group Gossip": Syncing the room history through any member currently in range.
- [ ] Membership tracking: Who is currently in the group and reachable.

## Success Criteria
1. Create a group on Device A. Device B joins.
2. Device A and B chat. Device A moves away.
3. Device C joins the group. Device B syncs A's old messages to C.
4. Photos shared in the group are visible and eventually deleted.
