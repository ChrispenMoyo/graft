// GRAFT Skeleton Loading States
// Shape-matched placeholders for content that is loading, so the
// interface shows what is coming instead of a frozen spinner.
// A single gentle opacity pulse keeps the skeleton visibly active
// without heavy animation (safe for older Android phones).

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// Wraps [child] in a slow opacity pulse.
class SkeletonPulse extends StatefulWidget {
  final Widget child;

  const SkeletonPulse({super.key, required this.child});

  @override
  State<SkeletonPulse> createState() => _SkeletonPulseState();
}

class _SkeletonPulseState extends State<SkeletonPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  late final Animation<double> _opacity = Tween(
    begin: 0.45,
    end: 0.9,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _opacity, child: widget.child);
  }
}

/// A single grey placeholder block.
class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const SkeletonBox({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.radius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: GraftColors.surfaceVariant,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

/// Placeholder that mirrors the GRAFT Job Card layout, used while job
/// lists load.
class SkeletonJobCard extends StatelessWidget {
  const SkeletonJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonPulse(
      child: Card(
        elevation: GraftElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.lg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SkeletonBox(width: 90, height: 18),
                  const Spacer(),
                  SkeletonBox(
                    width: 64,
                    height: 18,
                    radius: GraftBorderRadius.sm,
                  ),
                ],
              ),
              const SizedBox(height: GraftSpacing.md),
              const SkeletonBox(height: 18),
              const SizedBox(height: GraftSpacing.sm),
              const SkeletonBox(width: 220, height: 14),
              const SizedBox(height: GraftSpacing.lg),
              const Row(
                children: [
                  SkeletonBox(width: 90, height: 12),
                  SizedBox(width: GraftSpacing.lg),
                  SkeletonBox(width: 120, height: 12),
                ],
              ),
              const SizedBox(height: GraftSpacing.lg),
              Row(
                children: [
                  const SkeletonBox(width: 70, height: 20),
                  const Spacer(),
                  SkeletonBox(width: 80, height: 30, radius: GraftBorderRadius.sm),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Placeholder for the profile trust header block.
class SkeletonProfileHeader extends StatelessWidget {
  const SkeletonProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonPulse(
      child: Row(
        children: [
          const SkeletonBox(width: 96, height: 96, radius: 48),
          const SizedBox(width: GraftSpacing.lg),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonBox(width: 160, height: 22),
                SizedBox(height: GraftSpacing.md),
                SkeletonBox(width: 120, height: 14),
                SizedBox(height: GraftSpacing.sm),
                SkeletonBox(width: 90, height: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A vertical list of skeleton job cards.
class SkeletonJobList extends StatelessWidget {
  final int itemCount;

  const SkeletonJobList({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => const Padding(
          padding: EdgeInsets.only(bottom: GraftSpacing.md),
          child: SkeletonJobCard(),
        ),
      ),
    );
  }
}
