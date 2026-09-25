// GRAFT Card Components
// Reusable marketplace card widgets for jobs, workers, and bids

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// GRAFT Job Card
/// Displays information about a job listing
class JobCard extends StatelessWidget {
  final String title;
  final String category;
  final String area;
  final double? distance;
  final String? budget;
  final String status;
  final int bidCount;
  final VoidCallback? onTap;

  const JobCard({
    super.key,
    required this.title,
    required this.category,
    required this.area,
    this.distance,
    this.budget,
    required this.status,
    this.bidCount = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: GraftElevation.level1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status badge
              Align(
                alignment: Alignment.topRight,
                child: StatusBadge(
                  status: status,
                ),
              ),
              // Job title
              Text(
                title,
                style: GraftTypography.headlineSmall.copyWith(
                  color: GraftColors.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: GraftSpacing.sm),

              // Category and distance
              Row(
                children: [
                  Icon(
                    Icons.category,
                    size: GraftIcon.sm,
                    color: GraftColors.textSecondary,
                  ),
                  const SizedBox(width: GraftSpacing.xs),
                  Text(
                    category,
                    style: TextStyle(
                      fontFamily: GraftTypography.systemFontFallback,
                      color: GraftColors.textSecondary,
                      fontSize: GraftIcon.xs,
                    ),
                  ),
                  const SizedBox(width: GraftSpacing.md),
                  Icon(
                    Icons.place,
                    size: GraftIcon.sm,
                    color: GraftColors.textSecondary,
                  ),
                  const SizedBox(width: GraftSpacing.xs),
                  Text(
                    area,
                    style: TextStyle(
                      fontFamily: GraftTypography.systemFontFallback,
                      color: GraftColors.textSecondary,
                      fontSize: GraftIcon.xs,
                    ),
                  ),
                  if (distance != null) ...[
                    const Spacer(),
                    Text(
                      '${distance!.toStringAsFixed(1)} km',
                      style: TextStyle(
                        fontFamily: GraftTypography.systemFontFallback,
                        color: GraftColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: GraftIcon.xs,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: GraftSpacing.sm),

              // Budget and bid count
              if (budget != null || bidCount > 0)
                Row(
                  children: [
                    if (budget != null) ...[
                      Text(
                        budget!,
                        style: TextStyle(
                          fontFamily: GraftTypography.systemFontFallback,
                          color: GraftColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: GraftSpacing.md),
                    ],
                    if (bidCount > 0) ...[
                      Icon(
                        Icons.chat,
                        size: GraftIcon.sm,
                        color: GraftColors.textSecondary,
                      ),
                      const SizedBox(width: GraftSpacing.xs),
                      Text(
                        '$bidCount bids',
                        style: TextStyle(
                          fontFamily: GraftTypography.systemFontFallback,
                          color: GraftColors.textSecondary,
                          fontSize: GraftIcon.xs,
                        ),
                      ),
                    ],
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// GRAFT Worker Card
/// Displays worker profile information
class WorkerCard extends StatelessWidget {
  final String name;
  final String? primarySkill;
  final double rating;
  final int completedJobs;
  final VerificationBadgeType? verification;
  final String? distance;
  final String? availability;
  final String? bidPrice;
  final String? eta;
  final VoidCallback? onTap;

  const WorkerCard({
    super.key,
    required this.name,
    this.primarySkill,
    this.rating = 0.0,
    this.completedJobs = 0,
    this.verification,
    this.distance,
    this.availability,
    this.bidPrice,
    this.eta,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: GraftElevation.level1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.md),
          child: Row(
            children: [
              // Profile image placeholder
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: GraftColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(GraftBorderRadius.circle),
                ),
                child: const Icon(
                  Icons.person,
                  size: GraftIcon.lg,
                  color: GraftColors.primary,
                ),
              ),
              const SizedBox(width: GraftSpacing.lg),

              // Worker details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      name,
                      style: GraftTypography.headlineSmall.copyWith(
                        color: GraftColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: GraftSpacing.xs),

                    // Primary skill
                    if (primarySkill != null) ...[
                      Text(
                        primarySkill!,
                        style: TextStyle(
                          fontFamily: GraftTypography.systemFontFallback,
                          color: GraftColors.textSecondary,
                          fontSize: GraftIcon.sm,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.xs),
                    ],

                    // Verification badges
                    if (verification != null) ...[
                      Row(
                        children: [
                          VerificationBadge(type: verification!),
                        ],
                      ),
                    ],

                    // Stats row
                    Row(
                      children: [
                        RatingDisplay(rating: rating, size: GraftIcon.xs),
                        const SizedBox(width: GraftSpacing.sm),
                        Text(
                          '($completedJobs jobs)',
                          style: TextStyle(
                            fontFamily: GraftTypography.systemFontFallback,
                            color: GraftColors.textMuted,
                            fontSize: GraftIcon.xs,
                          ),
                        ),
                      ],
                    ),

                    // Distance
                    if (distance != null) ...[
                      const SizedBox(height: GraftSpacing.xs),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: GraftIcon.xs,
                            color: GraftColors.textSecondary,
                          ),
                          const SizedBox(width: GraftSpacing.xs),
                          Text(
                            distance!,
                            style: TextStyle(
                              fontFamily: GraftTypography.systemFontFallback,
                              color: GraftColors.textSecondary,
                              fontSize: GraftIcon.xs,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              // Bid price / ETA
              if (bidPrice != null || eta != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (bidPrice != null)
                      Text(
                        bidPrice!,
                        style: TextStyle(
                          fontFamily: GraftTypography.systemFontFallback,
                          color: GraftColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (eta != null)
                      Text(
                        eta!,
                        style: TextStyle(
                          fontFamily: GraftTypography.systemFontFallback,
                          color: GraftColors.textSecondary,
                          fontSize: GraftIcon.xs,
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// GRAFT Bid Card
/// Displays a worker's bid for a job
class BidCard extends StatelessWidget {
  final String workerName;
  final String price;
  final String? eta;
  final double rating;
  final VerificationBadgeType? verification;
  final String? shortMessage;
  final String? experience;
  final VoidCallback? onTap;

  const BidCard({
    super.key,
    required this.workerName,
    required this.price,
    this.eta,
    this.rating = 0.0,
    this.verification,
    this.shortMessage,
    this.experience,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: GraftElevation.level1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  // Worker name
                  Text(
                    workerName,
                    style: GraftTypography.headlineSmall.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: GraftSpacing.md),

                  // Verification badge
                  if (verification != null)
                    VerificationBadge(type: verification!),

                  const Spacer(),

                  // Price
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: GraftTypography.systemFontFallback,
                      color: GraftColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: GraftSpacing.md),

              // ETA
              if (eta != null) ...[
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: GraftIcon.sm,
                      color: GraftColors.textSecondary,
                    ),
                    const SizedBox(width: GraftSpacing.xs),
                    Text(
                      eta!,
                      style: TextStyle(
                        fontFamily: GraftTypography.systemFontFallback,
                        color: GraftColors.textSecondary,
                        fontSize: GraftIcon.sm,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: GraftSpacing.md),
              ],

              // Short message
              if (shortMessage != null) ...[
                Text(
                  shortMessage!,
                  style: TextStyle(
                    fontFamily: GraftTypography.systemFontFallback,
                    color: GraftColors.textSecondary,
                    fontSize: GraftIcon.sm,
                  ),
                ),
                const SizedBox(height: GraftSpacing.md),
              ],

              // Rating
              Row(
                children: [
                  RatingDisplay(rating: rating, size: GraftIcon.md),
                  const SizedBox(width: GraftSpacing.md),
                  Text(
                    'Based on $rating rating',
                    style: TextStyle(
                      fontFamily: GraftTypography.systemFontFallback,
                      color: GraftColors.textMuted,
                      fontSize: GraftIcon.sm,
                    ),
                  ),
                ],
              ),

              // Experience
              if (experience != null) ...[
                const SizedBox(height: GraftSpacing.md),
                Text(
                  'Experience: $experience',
                  style: TextStyle(
                    fontFamily: GraftTypography.systemFontFallback,
                    color: GraftColors.textSecondary,
                    fontSize: GraftIcon.sm,
                  ),
                ),
              ],
            ],
          ),
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: GraftSpacing.sm, vertical: GraftSpacing.xs),
      decoration: BoxDecoration(
        color: GraftColors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: Row(
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
              fontSize: GraftIcon.xs,
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

/// Rating Display
/// Shows a star rating
class RatingDisplay extends StatelessWidget {
  final double rating;
  final double size;

  const RatingDisplay({
    super.key,
    required this.rating,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    final fullStars = rating.floor();
    final hasHalf = rating - fullStars >= 0.5;
    final emptyStars = 5 - fullStars - (hasHalf ? 1 : 0);

    return Row(
      children: [
        Icon(
          Icons.star,
          size: size,
          color: GraftColors.primary,
        ),
        ...List.generate(fullStars, (_) => Icon(
              Icons.star,
              size: size,
              color: GraftColors.primary,
            )),
        if (hasHalf)
          Icon(
            Icons.star_half,
            size: size,
            color: GraftColors.primary,
          ),
        ...List.generate(emptyStars, (_) => Icon(
              Icons.star_border,
              size: size,
              color: GraftColors.textSecondary,
            )),
      ],
    );
  }
}

/// Status Badge
/// Displays job status with color coding
class StatusBadge extends StatelessWidget {
  final String status;
  final StatusColor? statusColor;

  const StatusBadge({
    super.key,
    required this.status,
    this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = statusColor ?? StatusColor.getStatusColor(status.toLowerCase());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GraftSpacing.sm, vertical: GraftSpacing.xs),
      decoration: BoxDecoration(
        color: color.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(GraftBorderRadius.xs),
      ),
      child: Text(
        _formatStatus(status),
        style: TextStyle(
          fontFamily: GraftTypography.systemFontFallback,
          fontSize: GraftIcon.xs,
          color: color.color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _formatStatus(String status) {
    if (status.isEmpty) return status;
    return status[0].toUpperCase() + status.substring(1);
  }
}

/// Status colors for job statuses
class StatusColor {
  final Color color;
  final String label;

  const StatusColor({required this.color, required this.label});

  static StatusColor getStatusColor(String status) {
    switch (status) {
      case 'draft':
        return const StatusColor(color: GraftColors.textMuted, label: 'Draft');
      case 'posted':
      case 'bidding':
        return const StatusColor(color: GraftColors.secondary, label: 'Bidding');
      case 'worker_selected':
        return const StatusColor(color: Color(0xFFFF9800), label: 'Selected');
      case 'payment_pending':
      case 'payment_confirmed':
        return const StatusColor(color: GraftColors.secondary, label: 'Payment');
      case 'worker_en_route':
      case 'work_started':
        return const StatusColor(color: Color(0xFF4CAF50), label: 'En Route');
      case 'work_completed':
      case 'customer_confirmed':
      case 'payment_released':
        return const StatusColor(color: Color(0xFF4CAF50), label: 'Completed');
      case 'completed':
        return const StatusColor(color: Color(0xFF4CAF50), label: 'Done');
      case 'cancelled':
      case 'expired':
        return const StatusColor(color: GraftColors.error, label: 'Cancelled');
      case 'payment_failed':
      case 'disputed':
        return const StatusColor(color: GraftColors.error, label: 'Issue');
      default:
        return const StatusColor(color: GraftColors.textSecondary, label: 'Unknown');
    }
  }
}

/// Distance Indicator
/// Shows distance with icon
class DistanceIndicator extends StatelessWidget {
  final double distance;
  final String? unit;

  const DistanceIndicator({
    super.key,
    required this.distance,
    this.unit = 'km',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.place,
          size: GraftIcon.sm,
          color: GraftColors.primary,
        ),
        const SizedBox(width: GraftSpacing.xs),
        Text(
          '${distance.toStringAsFixed(1)} $unit',
          style: TextStyle(
            fontFamily: GraftTypography.systemFontFallback,
            color: GraftColors.textPrimary,
            fontSize: GraftIcon.sm,
          ),
        ),
      ],
    );
  }
}

/// Price Display
/// Shows price with currency
class PriceDisplay extends StatelessWidget {
  final String price;
  final bool isUnitPrice;

  const PriceDisplay({
    super.key,
    required this.price,
    this.isUnitPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: TextStyle(
        fontFamily: GraftTypography.systemFontFallback,
        color: GraftColors.primary,
        fontWeight: isUnitPrice ? FontWeight.w400 : FontWeight.w600,
        fontSize: isUnitPrice ? GraftIcon.md : GraftIcon.lg,
      ),
    );
  }
}