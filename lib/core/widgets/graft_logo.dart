// GRAFT Logo Widget
// Renders the official brand artwork (the "G" location-pin mark) from assets.
// Omit [color] to show the full-color brand mark; pass a color for a
// single-tone version (e.g. white in dark app bars).

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

class GraftLogo extends StatelessWidget {
  final double size;
  final Color? color;
  final EdgeInsetsGeometry padding;

  const GraftLogo({
    super.key,
    this.size = 48,
    this.color,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'assets/graft_icon.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.medium,
      gaplessPlayback: true,
    );

    final tint = color;
    if (tint != null) {
      image = ColorFiltered(
        colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
        child: image,
      );
    }

    return Padding(
      padding: padding,
      child: SizedBox(
        width: size,
        height: size,
        child: Center(child: image),
      ),
    );
  }
}

/// GRAFT App Icon
/// The brand mark on a primary-green tile, as used for launcher branding.
class GraftAppIcon extends StatelessWidget {
  final double size;

  const GraftAppIcon({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: GraftColors.primary,
        child: Center(
          child: GraftLogo(
            size: size * 0.8,
            color: GraftColors.white,
          ),
        ),
      ),
    );
  }
}
