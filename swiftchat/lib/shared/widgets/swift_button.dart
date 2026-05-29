import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/swift_theme.dart';

enum SwiftButtonType { primary, secondary, icon }

class SwiftButton extends StatefulWidget {
  const SwiftButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.type = SwiftButtonType.primary,
    this.fullWidth = true,
  });

  final VoidCallback onPressed;
  final String? label;
  final IconData? icon;
  final SwiftButtonType type;
  final bool fullWidth;

  @override
  State<SwiftButton> createState() => _SwiftButtonState();
}

class _SwiftButtonState extends State<SwiftButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final swiftTheme = theme.extension<SwiftThemeExtension>()!;

    final Color backgroundColor = _getBackgroundColor(theme);
    final Color textColor = _getTextColor(theme);
    final Color borderColor =
        theme.brightness == Brightness.light ? Colors.black : Colors.white;

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        HapticFeedback.lightImpact();
      },
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.fullWidth ? double.infinity : null,
        padding: _getPadding(),
        transform: _isPressed
            ? Matrix4.translationValues(
                swiftTheme.shadowOffset.dx / 2,
                swiftTheme.shadowOffset.dy / 2,
                0,
              )
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(swiftTheme.buttonRadius),
          border: Border.all(
            color: borderColor,
            width: swiftTheme.borderWidth,
          ),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: borderColor,
                    offset: swiftTheme.shadowOffset,
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
        ),
        child: _buildContent(textColor),
      ),
    );
  }

  Widget _buildContent(Color textColor) {
    if (widget.type == SwiftButtonType.icon) {
      return Icon(widget.icon, color: textColor);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, color: textColor, size: 20),
          const SizedBox(width: 8),
        ],
        if (widget.label != null)
          Text(
            widget.label!.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: 16,
              letterSpacing: 1.0,
            ),
          ),
      ],
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    switch (widget.type) {
      case SwiftButtonType.primary:
        return theme.colorScheme.primary;
      case SwiftButtonType.secondary:
      case SwiftButtonType.icon:
        return theme.colorScheme.surface;
    }
  }

  Color _getTextColor(ThemeData theme) {
    switch (widget.type) {
      case SwiftButtonType.primary:
        return theme.brightness == Brightness.light
            ? Colors.white
            : Colors.black;
      case SwiftButtonType.secondary:
      case SwiftButtonType.icon:
        return theme.brightness == Brightness.light
            ? Colors.black
            : Colors.white;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    if (widget.type == SwiftButtonType.icon) {
      return const EdgeInsets.all(12);
    }
    return const EdgeInsets.symmetric(vertical: 16, horizontal: 24);
  }
}
