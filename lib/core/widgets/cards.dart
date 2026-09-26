// GRAFT Card Components
// Reusable marketplace card widgets. The Job Card (spec §5) is the most
// important: it exposes everything a person needs to decide whether a
// job is relevant without opening it - category, title, description,
// location, distance, schedule, budget and a clear View Job action.

import 'package:flutter/material.dart';
import '../../models/job.dart';
import '../design_tokens/design_tokens.dart';
import 'job_visuals.dart';
import 'trust_components.dart';

/// Category pill: small icon + uppercase category label in brand green.
class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GraftSpacing.sm,
        vertical: GraftSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: GraftColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            GraftCategoryIcons.forCategory(category),
            size: 12,
            color: GraftColors.primaryDark,
          ),
          const SizedBox(width: GraftSpacing.xs),
          Text(
            category.toUpperCase(),
            style: const TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              fontSize: GraftTypography.labelSmallFontSize,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: GraftColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}

/// Job status pill coloured by lifecycle stage.
class JobStatusBadge extends StatelessWidget {
  final JobStatus status;

  const JobStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = GraftJobStatusColors.forStatus(status);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GraftSpacing.sm,
        vertical: GraftSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          fontFamily: GraftTypography.systemFontFallback,
          fontSize: GraftTypography.labelSmallFontSize,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

/// Small "NEW" tag for jobs posted within the last day.
class NewJobTag extends StatelessWidget {
  const NewJobTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GraftSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: GraftColors.primary,
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: const Text(
        'NEW',
        style: TextStyle(
          fontFamily: GraftTypography.systemFontFallback,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: GraftColors.white,
        ),
      ),
    );
  }
}

/// GRAFT Job Card - the primary marketplace component (spec §5).
/// Shows the decision-making information at a glance and ends with a
/// clear "View Job" action.
class JobCard extends StatelessWidget {
  final String title;
  final String category;
  final String? description;
  final String? area;
  final double? distanceKm;
  final String? schedule;
  final String? budgetLabel;
  final JobStatus? status;
  final bool isNew;
  final String ctaLabel;
  final VoidCallback? onTap;

  const JobCard({
    super.key,
    required this.title,
    required this.category,
    this.description,
    this.area,
    this.distanceKm,
    this.schedule,
    this.budgetLabel,
    this.status,
    this.isNew = false,
    this.ctaLabel = 'View Job',
    this.onTap,
  });

  String? get _distanceLabel {
    if (distanceKm == null) return null;
    final metres = distanceKm! * 1000;
    if (metres < 1000) return '${metres.round()} m away';
    return '${(metres / 1000).toStringAsFixed(1)} km away';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: GraftElevation.level1,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.lg),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category, new tag and status
              Row(
                children: [
                  Expanded(
                    child: CategoryChip(category: category),
                  ),
                  if (isNew) ...[
                    const SizedBox(width: GraftSpacing.sm),
                    const NewJobTag(),
                  ],
                  if (status != null) ...[
                    const SizedBox(width: GraftSpacing.sm),
                    JobStatusBadge(status: status!),
                  ],
                ],
              ),
              const SizedBox(height: GraftSpacing.md),

              // Title
              Text(
                title,
                style: GraftTypography.headlineSmall.copyWith(
                  color: GraftColors.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              // Short description - one or two lines maximum
              if (description != null && description!.isNotEmpty) ...[
                const SizedBox(height: GraftSpacing.xs),
                Text(
                  description!,
                  style: GraftTypography.bodyMedium.copyWith(
                    color: GraftColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: GraftSpacing.md),

              // Key information: location, distance, schedule
              Wrap(
                spacing: GraftSpacing.lg,
                runSpacing: GraftSpacing.xs,
                children: [
                  if (area != null && area!.isNotEmpty)
                    MetaItem(icon: Icons.place_outlined, text: area!),
                  if (_distanceLabel != null)
                    MetaItem(
                      icon: Icons.directions_walk_outlined,
                      text: _distanceLabel!,
                      emphasise: true,
                    ),
                  if (schedule != null)
                    MetaItem(icon: Icons.schedule_outlined, text: schedule!),
                ],
              ),
              const SizedBox(height: GraftSpacing.lg),

              // Budget and the card's primary action
              Row(
                children: [
                  if (budgetLabel != null)
                    Expanded(
                      child: Text(
                        budgetLabel!,
                        style: GraftTypography.labelLarge.copyWith(
                          color: GraftColors.primaryDark,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  else
                    const Spacer(),
                  _CardCta(label: ctaLabel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The card's trailing call-to-action pill: "View Job >".
class _CardCta extends StatelessWidget {
  final String label;

  const _CardCta({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GraftSpacing.md,
        vertical: GraftSpacing.xs + 2,
      ),
      decoration: BoxDecoration(
        color: GraftColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              fontSize: GraftTypography.labelMediumFontSize,
              fontWeight: FontWeight.w700,
              color: GraftColors.primaryDark,
            ),
          ),
          const SizedBox(width: GraftSpacing.xs),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 14,
            color: GraftColors.primaryDark,
          ),
        ],
      ),
    );
  }
}

/// Verification Badge
/// Displays verification status for workers
class VerificationBadge extends StatelessWidget {
  final VerificationBadgeType type;

  const VerificationBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final badgeData = VerificationBadgeType.badgeData(type);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: GraftSpacing.sm, vertical: GraftSpacing.xs),
      decoration: BoxDecoration(
        color: GraftColors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            badgeData.icon,
            size: GraftIcon.xs,
            color: GraftColors.success,
          ),
          const SizedBox(width: GraftSpacing.xs),
          Text(
            badgeData.label,
            style: TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              fontSize: GraftTypography.labelSmallFontSize,
              color: GraftColors.success,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Verification Badge Types
/// Defines the types of verification badges
enum VerificationBadgeType {
  phoneVerified,
  identityVerified,
  ecoCashVerified,
  skillVerified,
  trustedWorker;

  String get label {
    switch (this) {
      case VerificationBadgeType.phoneVerified:
        return 'Phone Verified';
      case VerificationBadgeType.identityVerified:
        return 'ID Verified';
      case VerificationBadgeType.ecoCashVerified:
        return 'EcoCash Verified';
      case VerificationBadgeType.skillVerified:
        return 'Skill Verified';
      case VerificationBadgeType.trustedWorker:
        return 'Trusted Worker';
    }
  }

  IconData get icon {
    switch (this) {
      case VerificationBadgeType.phoneVerified:
        return Icons.phone;
      case VerificationBadgeType.identityVerified:
        return Icons.credit_card;
      case VerificationBadgeType.ecoCashVerified:
        return Icons.account_balance_wallet;
      case VerificationBadgeType.skillVerified:
        return Icons.work;
      case VerificationBadgeType.trustedWorker:
        return Icons.star;
    }
  }

  static VerificationBadgeData badgeData(VerificationBadgeType type) {
    return VerificationBadgeData(
      label: type.label,
      icon: type.icon,
    );
  }
}

/// Verification Badge Data
class VerificationBadgeData {
  final String label;
  final IconData icon;

  const VerificationBadgeData({required this.label, required this.icon});
}
