// GRAFT Offline State Widget
// Reusable offline state display for GRAFT

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';
import 'buttons.dart';

/// Offline State Widget
/// Shows when the device is not connected to the internet
class OfflineState extends StatelessWidget {
  final String? title;
  final String? description;
  final VoidCallback? onRetry;

  const OfflineState({
    super.key,
    this.title,
    this.description,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(GraftSpacing.xxxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 80,
              color: GraftColors.textMuted,
            ),
            const SizedBox(height: GraftSpacing.xxxl),
            Text(
              title ?? 'No Internet Connection',
              style: GraftTypography.headlineSmall.copyWith(
                color: GraftColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GraftSpacing.md),
            Text(
              description ??
                  'Some information may be unavailable.\nPlease check your network connection.',
              style: TextStyle(
                fontFamily: GraftTypography.systemFontFallback,
                color: GraftColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: GraftSpacing.xxxl),
              PrimaryButton(
                text: 'Try Again',
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Offline Banner
/// A banner that shows at the top of the screen when offline
class OfflineBanner extends StatelessWidget {
  final VoidCallback? onRetry;

  const OfflineBanner({
    super.key,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: GraftSpacing.lg,
        vertical: GraftSpacing.md,
      ),
      color: GraftColors.surfaceVariant,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: GraftIcon.md,
            color: GraftColors.textSecondary,
          ),
          const SizedBox(width: GraftSpacing.md),
          Text(
            'You are offline',
            style: TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              color: GraftColors.textSecondary,
            ),
          ),
          const SizedBox(width: GraftSpacing.sm),
          if (onRetry != null)
            TextButton(
              onPressed: onRetry,
              child: const Text('Try again'),
            ),
        ],
      ),
    );
  }
}