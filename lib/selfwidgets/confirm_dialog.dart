import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog({super.key,required this.content});

  String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('确认'),
      content: Text(content),
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

  static showLoadingDialog(
      {required BuildContext context, required String content}) =>
      showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return ConfirmDialog(
              content: content,
            );
          }
      );
}
