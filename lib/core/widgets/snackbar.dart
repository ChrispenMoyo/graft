// GRAFT Snackbar Widget
// Reusable snackbar for user feedback

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// GRAFT Snackbar
/// Shows brief messages at the bottom of the screen
class GraftSnackbar {
  /// Show a success message
  static void showSuccess(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: GraftColors.onSurface,
              size: GraftIcon.md,
            ),
            const SizedBox(width: GraftSpacing.sm),
            Text(message),
          ],
        ),
        backgroundColor: GraftColors.success,
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }

 /// Show an error message
  static void showError(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: GraftColors.onSurface,
              size: GraftIcon.md,
            ),
            const SizedBox(width: GraftSpacing.sm),
            Text(message),
          ],
        ),
        backgroundColor: GraftColors.error,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  /// Show an info message
  static void showInfo(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.info,
              color: GraftColors.onSurface,
              size: GraftIcon.md,
            ),
            const SizedBox(width: GraftSpacing.sm),
            Text(message),
          ],
        ),
        backgroundColor: GraftColors.info,
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }

  /// Show a warning message
  static void showWarning(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.warning,
              color: GraftColors.onSurface,
              size: GraftIcon.md,
            ),
            const SizedBox(width: GraftSpacing.sm),
            Text(message),
          ],
        ),
        backgroundColor: GraftColors.warning,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  /// Show a custom snackbar
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    Duration? duration,
    TextStyle? textStyle,
    VoidCallback? action,
    String? actionLabel,
  }) {
    final snackBar = SnackBar(
      content: Text(message, style: textStyle),
      backgroundColor: backgroundColor,
      duration: duration ?? const Duration(seconds: 3),
      action: action != null && actionLabel != null
          ? SnackBarAction(
              label: actionLabel,
              onPressed: action,
              textColor: GraftColors.onSurface,
            )
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Show an offline message
  static void showOffline(BuildContext context) {
    showInfo(
      context,
      'You are offline. Some features may be unavailable.',
    );
  }
}

/// Extension for BuildContext to show snackbars easily
extension GraftSnackBarExtension on BuildContext {
  void showSuccess(String message) => GraftSnackbar.showSuccess(this, message);

  void showError(String message) => GraftSnackbar.showError(this, message);

  void showInfo(String message) => GraftSnackbar.showInfo(this, message);

  void showWarning(String message) => GraftSnackbar.showWarning(this, message);
}