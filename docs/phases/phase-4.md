# Phase 4: Explore & Radar UI

**Goal:** Create a reactive, playful UI that makes discovering nearby people and groups intuitive and engaging.

## Requirements
- A default "Explore" page.
- A "Radar" view with interactive bubbles.
- Visual feedback for connection status (Connected, Out of Range, Syncing).
- Playful animations and transitions.

## Technical Tasks

### 3.1 Explore Hub
- [ ] Build the main `ExploreScreen`.
- [ ] Toggle between "Radar View" and "List View".
- [ ] Show count of "Nearby Peers" in real-time.

### 3.2 The Radar Engine
- [ ] Implement custom painter for the Radar circles.
- [ ] Build `PeerBubble` widget that "floats" and scales based on signal/proximity.
- [ ] Interaction: Tap bubble to show "Quick Info" bottom sheet.

### 3.3 Connection UI & Animations
- [ ] Implement the "Handshake" animation (visual confirmation of E2EE).
- [ ] Add "Green Dot" status for active high-speed connections.
- [ ] Add "Ghost/Fade" effect for peers who just moved out of range.
- [ ] Implement "Syncing..." visual cue when Gossip is active.

### 3.4 Profile Cards
- [ ] Detailed view of a peer: Bio, Topics (tags), and "Send Request".
- [ ] Group cards: Name, Topic, and "Join" button.

## Success Criteria
1. Explore page shows a "Pulse" animation.
2. Bubbles appear and move smoothly as devices move.
3. Tapping a bubble feels responsive and provides immediate info.
4. Visual difference between a "Direct" peer and a "Mesh" peer.
