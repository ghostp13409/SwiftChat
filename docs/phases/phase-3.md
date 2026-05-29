# Phase 3: Visual Identity & Design System

**Goal:** Establish a cohesive, premium visual language (Playful Organic / Neubrutalist) and build the foundational UI components.

## Requirements
- Comprehensive Theme Engine (Light & Dark support).
- Custom "Physical" Widget Library (Borders, Shadows, Bouncy Animations).
- Premium Onboarding Flow (The first impression).

## Technical Tasks

### 3.1 The SwiftTheme Engine
- [ ] Implement `ThemeExtension` for custom design tokens (Physical border widths, shadow offsets).
- [ ] Define the "Vivid Emerald" color system across Light and Dark modes.
- [ ] Setup high-contrast typography using bold sans-serif fonts.

### 3.2 Neubrutalist Component Library
- [ ] `SwiftButton`: Primary, Secondary, and Icon variants with hard shadows.
- [ ] `SwiftCard`: Container with thick borders and state-driven shadow colors.
- [ ] `SwiftStatusIndicator`: Glancable icons for connection states.

### 3.3 Onboarding: The First Impression
- [ ] Build a "Welcome" sequence that feels alive (animations).
- [ ] Interactive Profile Setup (Name, Bio, Avatar).
- [ ] **Crucial**: Permission "War Room" (Explaining why we need Bluetooth/Location in a friendly, low-friction way).

### 3.4 Navigation Overhaul
- [ ] Transition to a bottom-nav or gesture-based system that follows the "Low Cognitive Load" rule.
- [ ] Implement custom route transitions (Scale/Spring effects).

## Success Criteria
1. Switching between Light and Dark mode feels seamless and high-contrast.
2. Every button press feels "tactile" (Shadows shift, haptics trigger).
3. First-time users can set up their profile in under 30 seconds.
