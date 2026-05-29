import 'package:flutter/material.dart';
import '../../core/theme/swift_theme.dart';

class SwiftCard extends StatelessWidget {
  const SwiftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.shadowColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final swiftTheme = theme.extension<SwiftThemeExtension>()!;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(swiftTheme.cardRadius),
        border: Border.all(
          color: theme.brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          width: swiftTheme.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? swiftTheme.shadowColor,
            offset: swiftTheme.shadowOffset,
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
