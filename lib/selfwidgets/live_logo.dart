import 'dart:math';
import 'package:flutter/material.dart';

class LiveLogo extends StatefulWidget {
  const LiveLogo({super.key, required this.maxHeight});

  final int maxHeight;

  @override
  State<LiveLogo> createState() => _LiveLogoState();
}

class _LiveLogoState extends State<LiveLogo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    final minHeight = widget.maxHeight / 3 * 2;
    final maxHeight = (widget.maxHeight).toDouble();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
    animation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size.square(10),
          painter: LinesPainter(animation.value),
        );
      },
    );
  }
}

class LinesPainter extends CustomPainter {
  final double animationValue;

  LinesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final int numberOfLines = 4; // 线条数量
    final double spacing = size.width / (numberOfLines - 1); // 每条线的间距

    for (int i = 0; i < numberOfLines; i++) {
      // 高度按比例变化
      double lineHeight = size.height *
          (0.5 + 0.5 * animationValue);

      // 绘制每条线
      canvas.drawLine(
        Offset(spacing * i, size.height), // 起点：底部
        Offset(spacing * i, size.height - lineHeight), // 终点：根据高度变化
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
