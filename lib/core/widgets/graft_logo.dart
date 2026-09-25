// GRAFT Logo Widget
// Reusable vector-based logo combining "G" with a location-pin concept
// Designed to be recognizable at small sizes (app icon, favicon, etc.)

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
    final logoColor = color ?? Theme.of(context).colorScheme.primary;

    return Padding(
      padding: padding,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _GraftLogoPainter(color: logoColor),
        ),
      ),
    );
  }
}

/// A painter that draws the GRAFT logo (G + location pin)
/// The logo combines a location pin silhouette with a stylized "G"
class _GraftLogoPainter extends CustomPainter {
  final Color color;

  _GraftLogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Center and calculate dimensions
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final logoSize = size.shortestSide * 0.8;

    // Pin dimensions
    final pinWidth = logoSize * 0.6;
    final pinHeight = logoSize * 0.85;

    // Draw the pin stem (rectangle at bottom)
    final stemWidth = pinWidth * 0.35;
    final stemHeight = logoSize * 0.15;
    final stemPath = Path();
    stemPath.moveTo(centerX - stemWidth / 2, centerY + pinHeight / 4);
    stemPath.lineTo(centerX + stemWidth / 2, centerY + pinHeight / 4);
    stemPath.lineTo(centerX + stemWidth / 2, centerY + pinHeight / 4 + stemHeight);
    stemPath.lineTo(centerX - stemWidth / 2, centerY + pinHeight / 4 + stemHeight);
    stemPath.close();

    // Draw pin outline
    canvas.drawPath(stemPath, paint);

    // Draw the pin body (teardrop shape)
    final pinPath = Path();
    final topLeft = Offset(centerX - pinWidth / 2, centerY);
    final topRight = Offset(centerX + pinWidth / 2, centerY);
    final bottomCenter = Offset(centerX, centerY + pinHeight / 4);

    pinPath.moveTo(topLeft.dx, topLeft.dy);
    pinPath.lineTo(topRight.dx, topRight.dy);
    pinPath.lineTo(bottomCenter.dx, bottomCenter.dy);
    pinPath.lineTo(topLeft.dx, topLeft.dy);
    pinPath.close();

    canvas.drawPath(pinPath, paint);

    // Draw G symbol inside the pin
    final gPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Create a simple G shape
    final gCenterX = centerX;
    final gTopY = centerY + pinHeight * 0.05;
    final gBottomY = centerY + pinHeight * 0.35;
    final gLeftX = centerX - pinWidth * 0.28;
    final gRightX = centerX + pinWidth * 0.28;

    final gPath = Path();

    // Outer circle for G
    final radius = pinWidth * 0.28;
    gPath.addOval(Rect.fromCircle(
      center: Offset(gCenterX, gTopY - radius * 0.5),
      radius: radius,
    ));

    // Middle bar of G
    gPath.moveTo(gLeftX - 2, gTopY);
    gPath.lineTo(gRightX + 2, gTopY);

    // Bottom of G
    gPath.moveTo(gLeftX - 2, gBottomY);
    gPath.lineTo(gRightX + 2, gBottomY);

    canvas.drawPath(gPath, gPaint);
  }

  @override
  bool shouldRepaint(covariant _GraftLogoPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// GRAFT App Icon
/// A special version optimized for app icon size
class GraftAppIcon extends StatelessWidget {
  final double size;

  const GraftAppIcon({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: GraftColors.primary,
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: const GraftLogo(
            size: 40,
            color: GraftColors.white,
          ),
        ),
      ),
    );
  }
}