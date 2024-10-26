import 'package:flutter/material.dart';

class GpsSign extends StatelessWidget {
  const GpsSign({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('GPS签到'),
      content: Text('点击即可签到，无需担心，老师不会发现你溜了'),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('取消')
        ),
        TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('确定')
        ),
      ],
    );
  }
}
