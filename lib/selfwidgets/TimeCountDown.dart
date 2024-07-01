import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeCountDown extends StatefulWidget {
  TimeCountDown({required this.countdownTime, required this.timeEndFun});

  final int countdownTime;
  final VoidCallback timeEndFun;

  @override
  State<TimeCountDown> createState() => _TimeCountDownState();
}

class _TimeCountDownState extends State<TimeCountDown> {

  late RxInt allTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    allTime = widget.countdownTime.obs;
    startCountDown();
  }

  void startCountDown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (allTime.value > 0) {
        allTime.value--;
      } else {
        timer.cancel();
        widget.timeEndFun();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              width: 70,
              height: 45,
              child: Center(
                child: Text(
                  '${allTime.value} s',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )),
        Padding(padding: EdgeInsets.only(right: 5))
      ],
    );
  }
}
