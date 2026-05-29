# SwiftChat Project Index

Welcome to the SwiftChat development hub. This index serves as the entry point for all project documentation, specifications, and progress tracking.

## Core Documentation
- [**Product Definition**](./overview.md) - The high-level vision and feature set.
- [**Technical Architecture**](./architecture.md) - Deep dive into Mesh Networking, E2EE, and Data flow.
- [**Roadmap & Strategy**](./roadmap.md) - The phased development plan and milestones.

## Implementation Phases
Each phase contains detailed requirements, technical specs, and progress checklists.

1. [**Phase 1: Secure Foundation**](./phases/phase-1.md) - Discovery, Handshake, and Profiles.
2. [**Phase 2: Mesh & Gossip Engine**](./phases/phase-2.md) - Database, Gossip Protocol, and TTL.
3. [**Phase 3: Explore & Radar UI**](./phases/phase-3.md) - Discovery UI, Radar Bubbles, and Quick Info.
4. [**Phase 4: Social & Media**](./phases/phase-4.md) - Groups, File Sharing, and Topics.
5. [**Phase 5: Polish & Optimization**](./phases/phase-5.md) - Animations, Battery, and Performance.

## Development Standards
- **State Management**: (TBD - Recommended: Provider or Bloc for clean separation)
- **Database**: Isar (for performance and offline sync)
- **P2P Transport**: Google Nearby Connections
- **Security**: ECDH (Diffie-Hellman) + AES-256 + Ed25519 signatures
