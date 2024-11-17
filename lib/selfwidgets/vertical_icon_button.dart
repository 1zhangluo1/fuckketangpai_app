import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({super.key, required this.text, required this.icon, required this.onPressed});

  final String text;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8), // 设置内边距以调整圆的大小
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: icon,
          ),
          SizedBox(height: 4),
          Text(text,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
