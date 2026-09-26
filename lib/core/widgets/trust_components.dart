// GRAFT Trust Components
// Reusable building blocks that make trust visible throughout GRAFT:
// ratings, completed work, verification, availability and distance.
// Spec §17: these render only real information - a worker with no
// rating is shown as "New", never with a fabricated score.

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// Compact rating badge: "⭐ 4.8".
/// A null rating renders a neutral "New" pill instead of a fake score.
class RatingBadge extends StatelessWidget {
  final double? rating;
  final double? size;

  const RatingBadge({super.key, this.rating, this.size});

  @override
  Widget build(BuildContext context) {
    final fontSize = size ?? GraftTypography.labelSmallFontSize;

    if (rating == null) {
      return _pill(
        label: 'New',
        color: GraftColors.textSecondary,
        fontSize: fontSize,
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, size: fontSize + 4, color: GraftColors.warning),
        const SizedBox(width: 2),
        Text(
          rating!.toStringAsFixed(1),
          style: TextStyle(
            fontFamily: GraftTypography.systemFontFallback,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: GraftColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _pill({
    required String label,
    required Color color,
    required double fontSize,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GraftSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: GraftTypography.systemFontFallback,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}

/// Completed-work label: "87 jobs" or an honest "No jobs yet".
class CompletedJobsLabel extends StatelessWidget {
  final int count;
  final Color? color;

  const CompletedJobsLabel({super.key, required this.count, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      count > 0 ? '$count jobs' : 'No jobs yet',
      style: TextStyle(
        fontFamily: GraftTypography.systemFontFallback,
        fontSize: GraftTypography.labelSmallFontSize,
        color: color ?? GraftColors.textSecondary,
      ),
    );
  }
}

/// Availability pill: "ONLINE" in green or "OFFLINE" in grey.
class AvailabilityPill extends StatelessWidget {
  final bool isOnline;
  final bool compact;

  const AvailabilityPill({
    super.key,
    required this.isOnline,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isOnline ? GraftColors.success : GraftColors.textMuted;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? GraftSpacing.sm : GraftSpacing.md,
        vertical: compact ? 2 : GraftSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(GraftBorderRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: GraftSpacing.xs),
          Text(
            isOnline ? 'ONLINE' : 'OFFLINE',
            style: TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              fontSize: compact
                  ? GraftTypography.labelSmallFontSize
                  : GraftTypography.labelMediumFontSize,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

/// Small icon + text meta item used across cards:
/// 📍 Avondale · 📏 2.4 km · 🕐 Today • 14:00
class MetaItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final bool emphasise;

  const MetaItem({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.emphasise = false,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = colour;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: contentColor),
        const SizedBox(width: GraftSpacing.xs),
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: GraftTypography.systemFontFallback,
              fontSize: GraftTypography.labelSmallFontSize,
              fontWeight: emphasise ? FontWeight.w600 : FontWeight.w400,
              color: contentColor,
            ),
          ),
        ),
      ],
    );
  }

  Color get colour =>
      color ?? (emphasise ? GraftColors.primary : GraftColors.textSecondary);
}

/// Circular avatar with the user's initials, or a person icon when no
/// name is known. Used on profiles and trust cards.
class GraftAvatar extends StatelessWidget {
  final String? name;
  final double radius;
  final IconData? fallbackIcon;

  const GraftAvatar({
    super.key,
    this.name,
    this.radius = 24,
    this.fallbackIcon,
  });

  String get _initials {
    final trimmed = name?.trim() ?? '';
    if (trimmed.isEmpty) return '';
    final parts = trimmed.split(RegExp(r'\s+'));
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final hasInitials = _initials.isNotEmpty;
    return CircleAvatar(
      radius: radius,
      backgroundColor: GraftColors.primary.withValues(alpha: 0.12),
      child: hasInitials
          ? Text(
              _initials,
              style: TextStyle(
                fontFamily: GraftTypography.brandFont,
                fontSize: radius * 0.7,
                fontWeight: FontWeight.w600,
                color: GraftColors.primaryDark,
              ),
            )
          : Icon(
              fallbackIcon ?? Icons.person,
              size: radius,
              color: GraftColors.primary,
            ),
    );
  }
}

/// Section header with an optional trailing action ("View all").
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: GraftTypography.headlineSmall.copyWith(
              color: GraftColors.textPrimary,
            ),
          ),
        ),
        if (actionLabel != null && onAction != null)
          TextButton(
            onPressed: onAction,
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: GraftSpacing.sm),
            ),
            child: Text(actionLabel!),
          ),
      ],
    );
  }
}

/// Verification state for the profile trust checklist.
enum TrustVerificationState { verified, pending, unverified }

/// One row of a verification checklist, e.g. "Phone verified ✓".
/// Honest by design: only [TrustVerificationState.verified] shows a
/// green check; pending items are shown as outstanding work.
class TrustStatusRow extends StatelessWidget {
  final String label;
  final TrustVerificationState state;
  final String? pendingNote;

  const TrustStatusRow({
    super.key,
    required this.label,
    required this.state,
    this.pendingNote,
  });

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (state) {
      TrustVerificationState.verified => (Icons.check_circle, GraftColors.success),
      TrustVerificationState.pending => (Icons.radio_button_unchecked, GraftColors.warning),
      TrustVerificationState.unverified => (Icons.radio_button_unchecked, GraftColors.textMuted),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GraftSpacing.xs),
      child: Row(
        children: [
          Icon(icon, size: GraftIcon.sm, color: color),
          const SizedBox(width: GraftSpacing.sm),
          Expanded(
            child: Text(
              label,
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textPrimary,
              ),
            ),
          ),
          if (state == TrustVerificationState.pending && pendingNote != null)
            Text(
              pendingNote!,
              style: GraftTypography.bodySmall.copyWith(
                color: GraftColors.textMuted,
              ),
            ),
        ],
      ),
    );
  }
}

/// A small callout explaining that a marketplace capability is on its
/// way, used where a feature is not live yet (offers, chat, payments).
/// Keeps future features visible without faking them.
class ComingSoonNote extends StatelessWidget {
  final String message;

  const ComingSoonNote({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(GraftSpacing.lg),
      decoration: BoxDecoration(
        color: GraftColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        border: Border.all(
          color: GraftColors.primary.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            size: GraftIcon.sm,
            color: GraftColors.primary,
          ),
          const SizedBox(width: GraftSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: GraftTypography.bodySmall.copyWith(
                color: GraftColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
