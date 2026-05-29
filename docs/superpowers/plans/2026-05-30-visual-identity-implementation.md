# Phase 3: Visual Identity & Design System Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement the "Playful Organic Neubrutalist" design system, creating the core theme engine and component library.

**Architecture:** Custom `ThemeExtension` for neubrutalist tokens and a dedicated `shared/widgets` library.

**Tech Stack:** Flutter, Google Fonts, ThemeExtension.

---

### Task 1: SwiftTheme Engine Setup

**Files:**
- Create: `swiftchat/lib/core/theme/swift_theme.dart`
- Modify: `swiftchat/lib/main.dart`

- [ ] **Step 1: Create SwiftThemeExtension**

```dart
import 'package:flutter/material.dart';

class SwiftThemeExtension extends ThemeExtension<SwiftThemeExtension> {
  final double borderWidth;
  final Offset shadowOffset;
  final double cardRadius;
  final double buttonRadius;

  SwiftThemeExtension({
    this.borderWidth = 3.0,
    this.shadowOffset = const Offset(4.0, 4.0),
    this.cardRadius = 24.0,
    this.buttonRadius = 20.0,
  });

  @override
  SwiftThemeExtension copyWith({
    double? borderWidth,
    Offset? shadowOffset,
    double? cardRadius,
    double? buttonRadius,
  }) {
    return SwiftThemeExtension(
      borderWidth: borderWidth ?? this.borderWidth,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      cardRadius: cardRadius ?? this.cardRadius,
      buttonRadius: buttonRadius ?? this.buttonRadius,
    );
  }

  @override
  SwiftThemeExtension lerp(ThemeExtension<SwiftThemeExtension>? other, double t) {
    if (other is! SwiftThemeExtension) return this;
    return SwiftThemeExtension(
      borderWidth: ColorTween.lerp(null, null, t) as double? ?? 3.0, // Simplification
      shadowOffset: Offset.lerp(shadowOffset, other.shadowOffset, t)!,
      cardRadius: cardRadius, // No lerp for radius
      buttonRadius: buttonRadius,
    );
  }
}
```

- [ ] **Step 2: Define Light & Dark Theme Data**

Include `SwiftThemeExtension` in the `extensions` list of `ThemeData`. Use `Oswald` for headlines and `Inter` for body.

- [ ] **Step 3: Update main.dart**

Apply the new themes to `MaterialApp`.

---

### Task 2: Core Component Library

**Files:**
- Create: `swiftchat/lib/shared/widgets/swift_button.dart`
- Create: `swiftchat/lib/shared/widgets/swift_card.dart`

- [ ] **Step 1: Implement SwiftButton**
Build a `StatelessWidget` that handles primary/secondary/icon variants with hard shadows and a "pressed" state animation.

- [ ] **Step 2: Implement SwiftCard**
Build a container widget that uses the `SwiftThemeExtension` tokens for borders and shadows.

---

### Task 3: Redesign Onboarding (Profile Setup)

**Files:**
- Modify: `swiftchat/lib/features/profile/presentation/pages/profile_setup_page.dart`

- [ ] **Step 1: Apply Neubrutalist design to ProfileSetupPage**
Update the form to use `SwiftButton` and `SwiftCard`. Improve spacing and typography weights.

- [ ] **Step 2: Add Entrance Animations**
Use `AnimatedOpacity` and `SlideTransition` for a bouncy entrance of UI elements.
