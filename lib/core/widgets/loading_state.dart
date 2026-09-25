// GRAFT Loading State Widget
// Reusable loading indicator for GRAFT

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// GRAFT Loading State Widget
/// Shows a consistent loading indicator
class LoadingState extends StatelessWidget {
  final String? message;
  final double? size;

  const LoadingState({
    super.key,
    this.message,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size ?? GraftIcon.xxl,
            height: size ?? GraftIcon.xxl,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: GraftColors.primary,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: GraftSpacing.xxxl),
            Text(
              message!,
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Loading Overlay
/// Shows a modal overlay with loading indicator
class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String? message;

  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          ModalBarrier(
            dismissible: false,
            color: Colors.black45,
          ),
        if (isLoading)
          LoadingState(message: message),
      ],
    );
  }
}
