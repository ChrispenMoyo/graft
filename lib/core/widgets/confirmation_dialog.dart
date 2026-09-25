// GRAFT Confirmation Dialog Widget
// Reusable confirmation dialog for GRAFT

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// GRAFT Confirmation Dialog
/// A reusable dialog for confirming actions
class GraftConfirmationDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String confirmButtonText;
  final String? cancelButtonText;
  final Color? confirmButtonColor;
  final VoidCallback? onConfirm;
  final bool showCancel;

  const GraftConfirmationDialog({
    super.key,
    required this.title,
    this.message,
    required this.confirmButtonText,
    this.cancelButtonText = 'Cancel',
    this.confirmButtonColor,
    this.onConfirm,
    this.showCancel = true,
  });

  /// Show the confirmation dialog and return the result
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    String? message,
    String confirmButtonText = 'Confirm',
    String cancelButtonText = 'Cancel',
    Color? confirmButtonColor,
    bool showCancel = true,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => GraftConfirmationDialog(
        title: title,
        message: message,
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,
        confirmButtonColor: confirmButtonColor,
        onConfirm: () => Navigator.of(context).pop(true),
        showCancel: showCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: GraftTypography.headlineSmall.copyWith(
          color: GraftColors.textPrimary,
        ),
      ),
      content: message != null
          ? Text(
              message!,
              style: TextStyle(
                fontFamily: GraftTypography.systemFontFallback,
                color: GraftColors.textSecondary,
              ),
            )
          : const SizedBox.shrink(),
      actions: [
        if (showCancel)
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              cancelButtonText ?? 'Cancel',
              style: TextStyle(
                fontFamily: GraftTypography.systemFontFallback,
                color: GraftColors.textSecondary,
              ),
            ),
          ),
        TextButton(
          onPressed: onConfirm,
          style: TextButton.styleFrom(
            foregroundColor: confirmButtonColor ?? GraftColors.primary,
          ),
          child: Text(
            confirmButtonText,
            style: TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

/// Delete Job Confirmation
/// Pre-configured dialog for job deletion
class DeleteJobConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteJobConfirmationDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return GraftConfirmationDialog(
      title: 'Delete Job',
      message: 'Are you sure you want to delete this job? This cannot be undone.',
      confirmButtonText: 'Delete',
      cancelButtonText: 'Cancel',
      confirmButtonColor: GraftColors.error,
      onConfirm: onConfirm,
    );
  }
}

/// Logout Confirmation
/// Pre-configured dialog for logout
class LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutConfirmationDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return GraftConfirmationDialog(
      title: 'Logout',
      message: 'Are you sure you want to logout?',
      confirmButtonText: 'Logout',
      cancelButtonText: 'Cancel',
      confirmButtonColor: GraftColors.error,
      onConfirm: onConfirm,
    );
  }
}