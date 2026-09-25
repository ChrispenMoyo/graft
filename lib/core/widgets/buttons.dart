// GRAFT Button Components
// Reusable button widgets with consistent styling

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// GRAFT Primary Button
/// Main call-to-action button for primary actions
class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final bool isLoading;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: GraftTouchTarget.buttonHeight,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: GraftColors.white,
                ),
              )
            : icon != null
                ? Icon(icon, size: GraftIcon.md)
                : const SizedBox.shrink(),
        label: Text(
          text,
          style: const TextStyle(
            fontFamily: GraftTypography.systemFontFallback,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: GraftColors.primary,
          foregroundColor: GraftColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          ),
          elevation: GraftElevation.level1,
        ),
      ),
    );
  }
}

/// GRAFT Secondary Button
/// For secondary actions - uses primary color but outlined style
class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final bool isLoading;
  final IconData? icon;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: GraftTouchTarget.buttonHeight,
      child: OutlinedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : icon != null
                ? Icon(icon, size: GraftIcon.md)
                : const SizedBox.shrink(),
        label: Text(text),
        style: OutlinedButton.styleFrom(
          foregroundColor: GraftColors.primary,
          side: const BorderSide(color: GraftColors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          ),
        ),
      ),
    );
  }
}

/// GRAFT Tertiary/Text Button
/// Minimal button style for secondary actions
class TertiaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;

  const TertiaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: GraftColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: GraftIcon.md),
            const SizedBox(width: GraftSpacing.xs),
          ],
          Text(
            text,
            style: TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// GRAFT Destructive Button
/// Used for destructive actions like delete, cancel
class DestructiveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;

  const DestructiveButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: GraftTouchTarget.buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: GraftColors.error,
          foregroundColor: GraftColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          ),
          elevation: GraftElevation.level1,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: GraftTypography.systemFontFallback,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}