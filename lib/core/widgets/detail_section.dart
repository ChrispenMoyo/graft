// GRAFT Detail Section
// The card used on detail screens to present one labelled piece of
// information (budget, location, schedule, description, ...). Keeps
// detail screens visually consistent (spec §21).

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// A titled section card for detail screens.
class DetailSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const DetailSection({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: GraftSpacing.md),
      padding: const EdgeInsets.all(GraftSpacing.lg),
      decoration: BoxDecoration(
        color: GraftColors.surface,
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        border: Border.all(color: GraftColors.surfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: GraftIcon.sm, color: GraftColors.primary),
              const SizedBox(width: GraftSpacing.sm),
              Text(
                title,
                style: GraftTypography.labelLarge.copyWith(
                  color: GraftColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: GraftSpacing.sm),
          DefaultTextStyle(
            style: GraftTypography.bodyMedium.copyWith(
              color: GraftColors.textPrimary,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// A horizontally scrolling photo gallery for job photos (spec §6).
/// Rendered only when a job actually has photos.
class JobPhotoGallery extends StatelessWidget {
  final List<String> photos;

  const JobPhotoGallery({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    if (photos.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: GraftSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: GraftSpacing.xs, bottom: GraftSpacing.sm),
            child: Text(
              'Photos',
              style: GraftTypography.labelLarge.copyWith(
                color: GraftColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: GraftSpacing.sm),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                  child: Image.network(
                    photos[index],
                    width: 200,
                    height: 160,
                    fit: BoxFit.cover,
                    // Slow networks matter (spec §11): a failed image
                    // must not break the page.
                    errorBuilder: (_, __, ___) => Container(
                      width: 200,
                      height: 160,
                      color: GraftColors.surfaceVariant,
                      child: const Icon(
                        Icons.broken_image_outlined,
                        color: GraftColors.textMuted,
                      ),
                    ),
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        width: 200,
                        height: 160,
                        color: GraftColors.surfaceVariant,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
