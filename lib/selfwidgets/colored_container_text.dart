import 'package:flutter/material.dart';

class ColoredContainerText extends StatelessWidget {
  const ColoredContainerText({super.key, required this.text, required this.background, required this.textSize, this.textColor});

  final String text;
  final Color background;
  final Color? textColor;
  final double textSize;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: background.withOpacity(0.2),
      ),
      child: Text(text,style: TextStyle(fontSize: textSize,color: textColor ?? background),),
    );
  }
}
