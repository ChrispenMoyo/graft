// GRAFT Error State Widget
// Reusable error state display for GRAFT

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';
import 'buttons.dart';

class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String? retryButtonText;

  const ErrorState({
    super.key,
    required this.message,
    this.onRetry,
    this.retryButtonText = 'Retry',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(GraftSpacing.xxxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: GraftIcon.xxl,
              color: GraftColors.error,
            ),
            const SizedBox(height: GraftSpacing.xxxl),
            Text(
              message,
              style: GraftTypography.bodyLarge.copyWith(
                color: GraftColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: GraftSpacing.xxxl),
              PrimaryButton(
                text: retryButtonText ?? 'Retry',
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class NetworkErrorAction extends StatelessWidget {
  final VoidCallback? onRetry;

  const NetworkErrorAction({
    super.key,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      message: 'Unable to connect. Please check your network connection and try again.',
      onRetry: onRetry,
    );
  }
}