# SwiftChat Development Standards

This document outlines the architectural patterns, coding standards, and UI/UX principles for SwiftChat. Following these ensures the app remains maintainable, testable, and high-quality.

## 1. Clean Architecture (Layered)

We use a layered architecture to separate concerns. Each layer should only know about the layers below it.

### 🏛️ Layers
1.  **Presentation (UI)**: Widgets and State Management (Cubit/BLoC). 
    - *Rules*: No business logic or database calls here. Only UI state and user event handling.
2.  **Domain (Business Logic)**: Entities, Use Cases, and Repository Interfaces.
    - *Rules*: This is pure Dart code. No dependencies on Flutter or external packages if possible.
3.  **Data (Infrastructure)**: Repository Implementations, Data Sources (Isar, Nearby API), and Models.
    - *Rules*: Handles data fetching, mapping JSON/DTOs to Entities, and caching.

## 2. Project Structure (Feature-First)

The project is organized by **feature** to allow for independent development and scaling.

```text
lib/
├── core/               # App-wide utilities, theme, errors, constants
├── shared/             # Reusable widgets/logic across multiple features
└── features/
    └── [feature_name]/
        ├── data/       # Models, Repositories, DataSources
        ├── domain/     # Entities, Use Cases, Repo Interfaces
        └── presentation/
            ├── bloc/   # State management
            ├── pages/  # Full screens
            └── widgets/# Feature-specific widgets
```

## 3. State Management & DI

- **State Management**: **flutter_bloc** (Cubit or BLoC). 
    - Use **Cubit** for simple state (e.g., UI toggles).
    - Use **BLoC** for complex events (e.g., Mesh Sync events, Streams).
- **Dependency Injection**: **get_it**.
    - All repositories and services must be registered and injected to allow for easy mocking in tests.

## 4. Coding Standards

- **Formatting**: Always run `dart format .` before committing.
- **Linting**: Follow `flutter_lints`. Custom rules are defined in `analysis_options.yaml`.
- **Naming**:
    - Classes: `PascalCase`
    - Variables/Functions: `camelCase`
    - Files: `snake_case`
- **Safety**: 
    - Use `const` constructors wherever possible.
    - Avoid `!` (bang operator). Use proper null-safety patterns.
    - All public API methods in the Data/Domain layer should be documented with `///`.

## 5. UI/UX Principles

- **Material 3**: Use Material 3 widgets and `ColorScheme.fromSeed`.
- **Responsiveness**: Use `LayoutBuilder` and avoid hardcoded pixel values for layout-critical elements.
- **Animations**: Use `ImplicitlyAnimatedWidget` (AnimatedContainer, AnimatedOpacity) for "Playful" effects.
- **Feedback**: Every user action should have visual feedback (Haptics, Loading states, SnackBar for errors).

## 6. Testing Strategy

- **Unit Tests**: Mandatory for all Use Cases and Repositories.
- **Widget Tests**: Mandatory for complex shared widgets.
- **Integration Tests**: Required for the Core Mesh Handshake flow.
- **Mocks**: Use `mockito` or `mocktail` for simulating network/P2P data.

## 7. Error Handling

- Use a `Failure` class in the Domain layer to represent errors.
- Methods in the Repository/Domain layer should return a `dartz` `Either<Failure, Success>` to force explicit error handling in the UI.
