# SwiftChat Project Instructions

SwiftChat is a P2P local chat application built with Flutter, designed to work without an internet connection or a cellular network. It utilizes Bluetooth and Wi-Fi mesh networking to provide seamless and secure communication for travelers.

## Project Overview

- **Technologies**: Flutter, Dart.
- **Key Features**: Mesh networking, end-to-end encryption, temporary chats, local-only communication, file sharing, and peer profiles.
- **Architecture**:
    - Root directory contains documentation (`docs/`) and project-level README.
    - `swiftchat/`: The main Flutter application source code.

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / Xcode (for mobile development)

### Building and Running

Commands should be executed within the `swiftchat/` directory:

```bash
cd swiftchat
flutter pub get
flutter run
```

### Testing and Quality

```bash
cd swiftchat
flutter analyze
flutter test
```

## Development Conventions

- **Architecture**: Strict **Clean Architecture** (Data, Domain, Presentation). See [Development Standards](./docs/standards.md).
- **State Management**: `flutter_bloc` (Cubit/BLoC) for predictable state transitions.
- **Dependency Injection**: `get_it` for decoupling components.
- **State management**: (TODO: Define preferred state management as the project evolves)
- **Linting**: Uses `flutter_lints` as defined in `swiftchat/analysis_options.yaml`.
- **Documentation**: Keep `docs/overview.md` and `docs/SWIFTCHAT_INDEX.md` updated.
- **Encryption**: ECDH (Diffie-Hellman) + AES-256 for E2EE.
- **Standards**: All code must adhere to the [SwiftChat Development Standards](./docs/standards.md).

## Directory Structure

- `docs/`: Architectural overview and feature documentation.
- `swiftchat/`:
    - `lib/`: Main application code.
    - `test/`: Widget and unit tests.
    - `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/`: Platform-specific configurations.
