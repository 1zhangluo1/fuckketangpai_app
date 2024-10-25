import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('确认'),
      content: Text('你确定要拨打这个电话吗?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context,false),
            child: Text('取消')
        ),
        TextButton(
            onPressed: () => Navigator.pop(context,true),
            child: Text('确定')
        ),
      ],
    );
  }
}
