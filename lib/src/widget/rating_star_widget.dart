import 'dart:ui';

import 'package:widgets_by_zpdl/material.dart';

class RatingStarWidget extends StatelessWidget {

  final double rating;

  final int starCount;
  final double starSize;
  final double starSpace;

  final Color ratingColor;
  final Color starColor;

  const RatingStarWidget({
    Key? key,
    required this.rating,
    required this.starCount,
    this.starSize = 32,
    this.starSpace = 2,
    this.ratingColor = Colors.yellow,
    this.starColor = Colors.yellow,
  })  : assert(starCount >= 1 && rating <= starCount),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = starSize * starCount + starSpace * (starCount - 1);
    final height = starSize;
    return CustomPaint(
      size: Size(width, height),
      painter: _RatingStarPainter(rating, starCount, starSize, starSpace, ratingColor, starColor),
    );
  }
}

class _RatingStarPainter extends CustomPainter {

  final double rating;

  final int starCount;
  final double starSize;
  final double starSpace;

  final Color ratingColor;
  final Color starColor;

  _RatingStarPainter(this.rating, this.starCount, this.starSize, this.starSpace, this.ratingColor, this.starColor);


  @override
  void paint(Canvas canvas, Size size) {
    final floor = rating.floorToDouble();
    final double ratingWidth = floor * (starSize + starSpace) + (rating - floor) * starSize;

    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    _drawStars(canvas, Icons.star, ratingColor);
    canvas.drawRect(
        Rect.fromLTRB(ratingWidth, 0, size.width, starSize),
        Paint()
          ..color = Colors.pink
          ..blendMode = BlendMode.dstOut);
    canvas.restore();
    _drawStars(canvas, Icons.star_outline, starColor);
  }

  void _drawStars(Canvas canvas, IconData icon, Color color) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            color: color,
            fontSize: starSize,
            fontFamily: icon.fontFamily,
            package: icon.fontPackage));
    textPainter.layout();
    for(int i = 0; i < starCount; i++) {
      textPainter.paint(canvas, Offset(i * (starSize + starSpace), 0));
    }
  }

  @override
  bool shouldRepaint(_RatingStarPainter oldDelegate) =>
      oldDelegate.rating != rating &&
      oldDelegate.starCount != starCount &&
      oldDelegate.starSize != starSize &&
      oldDelegate.starSpace != starSpace &&
      oldDelegate.ratingColor != ratingColor &&
      oldDelegate.starColor != starColor;
}