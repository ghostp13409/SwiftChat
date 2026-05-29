# SwiftChat Roadmap & Strategy

The development of SwiftChat is divided into five logical phases to ensure stability and focus.

## Phase Overview

| Phase | Title | Focus | Primary Goal |
|---|---|---|---|
| **1** | **Secure Foundation** | Networking & Security | Two devices can talk securely. |
| **2** | **Gossip Engine** | Mesh & Database | Messages survive disconnection/replays. |
| **3** | **Explore UI** | Discovery & UX | Visualizing the "Radar" and Peers. |
| **4** | **Social Features** | Groups & Files | Rich interaction and media. |
| **5** | **Polish** | Performance & Feel | Playful UI and battery optimization. |

## Milestones

### Milestone 1: The "Hello Mesh" (End of Phase 1)
- [ ] Profile created and stored.
- [ ] Discovery finds a nearby device.
- [ ] Encrypted handshake successful.
- [ ] Direct text message sent and received.

### Milestone 2: The "Ghost Message" (End of Phase 2)
- [ ] Message stored in local DB.
- [ ] Message survives app restart.
- [ ] Message relayed through a 3rd device successfully.
- [ ] TTL auto-deletion verified.

### Milestone 3: The "Radar Experience" (End of Phase 3)
- [ ] Radar view showing real-time proximity bubbles.
- [ ] Profile cards with topics visible.
- [ ] Playful connection animations.

### Milestone 4: The "Traveler's Hub" (End of Phase 4)
- [ ] Public and Private groups functional.
- [ ] Topic matching highlights.
- [ ] Image/File sharing verified over mesh.

### Milestone 5: "Production Ready" (End of Phase 5)
- [ ] Battery drain analysis completed.
- [ ] Storage management limits enforced.
- [ ] Haptic and sound feedback integrated.
