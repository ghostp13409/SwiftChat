# SwiftChat Tech Achievements Log

This document tracks impressive technologies, architectural patterns, and engineering techniques implemented in SwiftChat. This is intended to serve as a high-signal reference for project highlights and resume-building.

## 🚀 Core Technologies & High-Impact Techniques

### Phase 1: Foundation & P2P Discovery
*   **Decentralized P2P Networking**: Implemented direct device-to-device communication using **Google Nearby Connections API**, enabling connectivity without internet or cellular infrastructure.
*   **Clean Architecture (SOLID)**: Enforced a strict separation of concerns (Presentation, Domain, Data layers) to ensure the codebase remains maintainable, testable, and scalable.
*   **End-to-End Encryption (E2EE)**: Integrated the `cryptography` package to establish secure communication channels between peers.
*   **Reactive State Management**: Utilized **flutter_bloc** for predictable, event-driven UI state transitions across a complex peer discovery flow.
*   **Dependency Injection**: Leveraged **get_it** for loose coupling of services and repositories, facilitating robust unit testing.

### Phase 2: Mesh & Gossip Engine (Completed)
*   **Isar NoSQL Database Migration**: Transitioned from SQLite/Drift to **Isar** for high-performance, document-based local storage with ACID compliance, optimized for resource-constrained mobile devices.
*   **Gossip Protocol Implementation**: Designed and built a custom synchronization handshake to propagate messages across a non-contiguous mesh network using ID/Timestamp summaries.
*   **Store-and-Forward Relay Logic**: Implemented an opportunistic relay system allowing devices to act as network nodes, caching and forwarding data for peers not in direct range.
*   **Smart Power Management (SyncManager)**: Engineered a "Smart Sync" algorithm that balances network freshness with battery longevity by utilizing dynamic discovery windows (30s on / 3m off).
*   **TTL (Time-To-Live) & Storage Management**: Built an automated `CleanupWorker` to manage storage limits (2000 record cap) and enforce message volatility (24h TTL) across the database.
*   **Enhanced Chat UX**: Integrated WhatsApp-style message status tracking (Pending, Sent, Delivered) and a "Message Info" view providing transparency into the mesh network's behavior.
