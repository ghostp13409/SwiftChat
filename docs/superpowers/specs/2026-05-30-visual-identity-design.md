# SwiftChat Visual Identity & Design System Specification

**Date:** 2026-05-30
**Status:** Draft
**Phase:** 3

## 1. Design Philosophy: "Playful Organic Neubrutalism"
SwiftChat's UI is designed for **Glanceable Utility** and **Low Cognitive Load**. It combines the boldness of Neubrutalism (thick borders, hard shadows) with organic, bouncy interactions to feel like a high-end travel tool.

### Key Pillars
- **Physicality**: Elements have thick borders (3px) and hard-offset shadows (4px-6px).
- **State-Driven Color**: Colors are functional (Green = Active, Purple = Mesh, Blue = Syncing).
- **Bold Typography**: High-weight sans-serifs (Oswald/Inter) for immediate readability.
- **Spring Physics**: All UI transitions use spring-based animations to feel "alive".

---

## 2. Visual Foundation

### 2.1 Color Palette (Functional)
| Name | Hex | Usage |
|---|---|---|
| **Vivid Emerald** | `#00D26A` | Primary Brand, Active Peers, Sent Status |
| **Electric Indigo** | `#5856D6` | Mesh Packets, Relayed Status, Groups |
| **Pure Black** | `#0B0E14` | Dark Mode Background |
| **Pure White** | `#FFFFFF` | Light Mode Background, Dark Mode Borders |
| **Error Red** | `#FF3B30` | Failures, Out of Range |

### 2.2 Typography
- **Headlines**: `GoogleFonts.oswald` (Bold/ExtraBold).
- **Body/Actions**: `GoogleFonts.inter` or `GoogleFonts.roboto` (Weights: 600, 700, 900).

---

## 3. Information Architecture (The "3-Pane Flow")
SwiftChat uses a physical, spatial mental model for navigation.

### 3.1 Horizontal Navigation (X-Axis)
- **Left Pane (Profile & Settings)**: User identity, preferences, and security settings.
- **Home Pane (Active Chats)**: The default landing screen. A list of ongoing mesh conversations.
- **Interaction**: Users swipe Right from Chats to access Profile.

### 3.2 Vertical Overlay (Y-Axis)
- **Radar (Discovery)**: Immersive layer for finding new peers.
- **Interaction**: Swipe Up on a floating "📡 RADAR" button (bottom-right of Chat list).
- **Privacy Toggle**: Located at the top of the Radar view. Options: **"CONTACTS ONLY"** vs **"EVERYONE"**.

---

## 4. Core Components (The "Swift" Library)

### 3.1 SwiftTheme Extension
A custom `ThemeExtension` to provide consistent neubrutalist tokens across the app:
- `borderWidth`: default 3.0
- `shadowOffset`: Offset(4.0, 4.0)
- `cardRadius`: 24.0
- `buttonRadius`: 20.0

### 3.2 SwiftButton
- **Primary**: Brand color background, black text (light) or white text (dark), thick black/white border, hard shadow.
- **Feedback**: On press, the shadow offset reduces to 0 (the "press" effect).

### 3.3 SwiftCard
- Container for profile previews and message bubbles.
- Hard shadow matching the "State" of the data inside (e.g., green shadow for a nearby peer).

---

## 4. Onboarding Flow Redesign
The current onboarding is a simple form. The new flow will be multi-step:
1.  **Splash/Vibe**: Big animated logo + "Offline. Encrypted. Local."
2.  **Permission Guidance**: Tactile cards explaining Bluetooth/Location permissions *before* the system prompt.
3.  **Identity Creation**: The rounded profile setup with topic chips.

---

## 5. Implementation Strategy
1.  Create `lib/core/theme/swift_theme.dart` and define the `ThemeExtension`.
2.  Build the `Swift` component library in `lib/shared/widgets/`.
3.  Rewrite `ProfileSetupPage` and `main.dart` to use the new design system.
