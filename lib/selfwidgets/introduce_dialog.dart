import 'package:flutter/material.dart';

class IntroduceDialog extends StatelessWidget {
  const IntroduceDialog({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              ),
              SizedBox(
                height: 16,
              ),
              Text(content,style: TextStyle(fontSize: 16),),
              SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: () => hideDialog(context: context), child: Text('我知道了',style: TextStyle(color: Colors.lightBlue),))
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showLoadingDialog(
      {required BuildContext context, required String title, required String content}) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return IntroduceDialog(
                title: title,
                content: content,
            );
          }
      );

  static hideDialog({required BuildContext context}) => Navigator.pop(context);


}
