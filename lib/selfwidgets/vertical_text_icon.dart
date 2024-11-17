import 'package:flutter/material.dart';

class VerticalTextIcon extends StatelessWidget {
  const VerticalTextIcon({super.key, required this.text, required this.icon, required this.background, required this.textSize});

  final String text;
  final double textSize;
  final Icon icon;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(8), // 设置内边距以调整圆的大小
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: background,
          ),
          child: icon,
        ),
        SizedBox(height: 4),
        Text(text,style: TextStyle(fontSize: textSize,color: Colors.grey),),
      ],
    );
  }
}
