import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../pages/scan.dart';

class SignWaysSelectDialog extends StatelessWidget {
  const SignWaysSelectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    List signWays = [
      {'扫码签到': 1},
      {'数字签到': 2},
      {'GPS签到': 3},
    ];
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: signWays.map((way) => ListTile(title: Text(way.keys.first),onTap: () {
            int selectNum = way.values.first;
            enterWayFromNum(selectNum, context);
          },)).toList(),
        ),
      ),
    );
  }

  void enterWayFromNum(int num,BuildContext context) async {
    switch (num) {
      case 1:
        BarcodeCapture result = await Get.to(Scan());
        String url = result.barcodes.first.rawValue.toString();
        Navigator.of(context).pop(url);
      case 2:
        Navigator.of(context).pop('数字签到');
      case 3:
        Navigator.of(context).pop('GPS签到');
    }
  }

  signAllPeople(List<Users> users)  {
    users.forEach((user) {});
  }

}
