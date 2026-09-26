// GRAFT Job Visual Helpers
// Shared mappings from job data to visuals: category icons,
// status colours, USD price labels and human-friendly schedules.
// Keeping these in one place stops screens from inventing their own
// colours and formats for the same data.

import 'package:flutter/material.dart';
import '../../models/job.dart';
import '../design_tokens/design_tokens.dart';

/// Icons for job categories, matched by category label
class GraftCategoryIcons {
  GraftCategoryIcons._();

  static const Map<String, IconData> _byLabel = {
    'Gardening': Icons.grass,
    'Cleaning': Icons.cleaning_services,
    'Plumbing': Icons.plumbing,
    'Electrical': Icons.electric_bolt,
    'Painting': Icons.format_paint,
    'Moving': Icons.local_shipping,
    'Handyman': Icons.handyman,
    'Errands': Icons.shopping_basket,
    'Other': Icons.more_horiz,
  };

  /// Icon for a category label; falls back to a neutral work icon
  static IconData forCategory(String? category) {
    if (category == null) return Icons.work_outline;
    return _byLabel[category] ?? Icons.work_outline;
  }
}

/// Colour for a job lifecycle status.
/// Green = healthy/active, blue = in progress, orange = waiting on a
/// decision, red = problem, grey = neutral.
class GraftJobStatusColors {
  GraftJobStatusColors._();

  static Color forStatus(JobStatus status) {
    switch (status) {
      case JobStatus.draft:
        return GraftColors.textMuted;
      case JobStatus.posted:
      case JobStatus.bidding:
        return GraftColors.primary;
      case JobStatus.workerSelected:
        return const Color(0xFFFF9800);
      case JobStatus.paymentPending:
      case JobStatus.paymentConfirmed:
      case JobStatus.workerEnRoute:
      case JobStatus.workStarted:
        return GraftColors.info;
      case JobStatus.workCompleted:
      case JobStatus.customerConfirmed:
      case JobStatus.paymentReleased:
      case JobStatus.completed:
        return GraftColors.success;
      case JobStatus.cancelled:
      case JobStatus.expired:
      case JobStatus.paymentFailed:
      case JobStatus.disputed:
        return GraftColors.error;
    }
  }
}

/// Formats a USD amount the way GRAFT shows prices: "$20" instead of
/// "USD 20.00". Whole amounts drop the cents.
String formatUsd(double amount) {
  final isWhole = amount == amount.roundToDouble();
  return '\$${isWhole ? amount.toStringAsFixed(0) : amount.toStringAsFixed(2)}';
}

/// Short budget label for a job, used on cards and detail screens.
/// - Fixed budget:        "$20"
/// - Open to offers w/ target: "From $20"
/// - Open to offers only: "Open to offers"
String jobBudgetLabel(Job job) {
  final budget = job.budget;
  if (budget == null) return 'Open to offers';
  if (job.pricingPreference == PricingPreference.openToOffers) {
    return 'From ${formatUsd(budget)}';
  }
  return formatUsd(budget);
}

/// Human schedule label: "Today • 14:00", "Tomorrow • 09:00",
/// "Fri 3 Oct • 14:00". Returns null when nothing is set.
String? formatSchedule(DateTime? date, TimeOfDay? time) {
  if (date == null) return null;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);
  final dayDifference = target.difference(today).inDays;

  const monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  const weekdayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  String dayLabel;
  if (dayDifference == 0) {
    dayLabel = 'Today';
  } else if (dayDifference == 1) {
    dayLabel = 'Tomorrow';
  } else {
    final weekday = weekdayNames[target.weekday - 1];
    dayLabel = '$weekday ${target.day} ${monthNames[target.month - 1]}';
  }

  if (time == null) return dayLabel;
  final hh = time.hour.toString().padLeft(2, '0');
  final mm = time.minute.toString().padLeft(2, '0');
  return '$dayLabel • $hh:$mm';
}

/// Distance label in metres or kilometres: "850 m away" / "2.4 km away".
/// Returns null when no distance is available.
String? formatDistance(double? metres) {
  if (metres == null) return null;
  if (metres < 1000) return '${metres.round()} m away';
  return '${(metres / 1000).toStringAsFixed(1)} km away';
}
