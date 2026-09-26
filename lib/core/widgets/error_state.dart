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

/// Compact, left-aligned error state for use inside a screen section
/// (e.g. "Couldn't load nearby jobs" above the job list). Explains what
/// went wrong and what the user can do, per spec §16.
class InlineErrorState extends StatelessWidget {
  final String title;
  final String? description;
  final VoidCallback? onRetry;
  final String retryLabel;

  const InlineErrorState({
    super.key,
    required this.title,
    this.description,
    this.onRetry,
    this.retryLabel = 'Try Again',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(GraftSpacing.lg),
      decoration: BoxDecoration(
        color: GraftColors.error.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        border: Border.all(color: GraftColors.error.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.wifi_off_outlined,
            size: GraftIcon.lg,
            color: GraftColors.error,
          ),
          const SizedBox(width: GraftSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GraftTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: GraftColors.textPrimary,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: GraftSpacing.xs),
                  Text(
                    description!,
                    style: GraftTypography.bodySmall.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onRetry != null)
            TextButton(
              onPressed: onRetry,
              child: Text(retryLabel),
            ),
        ],
      ),
    );
  }
}