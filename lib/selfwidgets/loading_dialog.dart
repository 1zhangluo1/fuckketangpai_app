import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 87, 87, 87),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                  color: Colors.white
              ),
              SizedBox(
                height: 25,
              ),
              Text(text,style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 2,decoration: TextDecoration.none),overflow: TextOverflow.ellipsis)
            ],
          ),
        ),
      ),
    );
  }

  static showLoadingDialog(
      {required BuildContext context, required String hintText}) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LoadingDialog(text: hintText);
          }
      );

  static hideDialog({required BuildContext context}) => Navigator.pop(context);

}
