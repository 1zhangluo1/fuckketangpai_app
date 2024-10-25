import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class NumberSign extends StatefulWidget {
  const NumberSign({super.key});

  @override
  State<NumberSign> createState() => _NumberSignState();
}

class _NumberSignState extends State<NumberSign> {
  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,

      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Color.fromRGBO(212, 192, 251, 1.0),
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(18, 119, 214, 1.0)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(233, 220, 244, 1.0),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('数字签到'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('请输入四位数字完成签到',style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 36,
            ),
            Center(
              child: Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ),
            SizedBox(height: 200,)
          ],
        ),
      ),
    );
  }

}
