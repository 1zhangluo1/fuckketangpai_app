import 'package:flutter/material.dart';

class ExamConfirmDialog extends StatelessWidget {
  ExamConfirmDialog({super.key, required this.content});

  String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(content,style: TextStyle(fontSize: 16),),
            SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () => Navigator.pop(context,true),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey),
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        '确定',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      )),
                ),
                SizedBox(width: 18,),
                Expanded(
                  child: OutlinedButton(
                      onPressed: () => Navigator.pop(context,false),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.all(12),
                          side: BorderSide(color: Colors.transparent),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        '继续答题',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static showLoadingDialog(
          {required BuildContext context, required String content}) =>
      showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return ExamConfirmDialog(
              content: content,
            );
          });
}
