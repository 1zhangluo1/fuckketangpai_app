import 'package:flutter/material.dart';

class QrcodeDialog extends StatelessWidget {
  const QrcodeDialog({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.network(url),
      ),
    );
  }

  static showLoadingDialog(
      {required BuildContext context, required String url}) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return QrcodeDialog(url: url);
          }
      );

  static hideDialog({required BuildContext context}) => Navigator.pop(context);

}
