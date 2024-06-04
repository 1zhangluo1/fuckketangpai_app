import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckketangpai/scan.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FuckKetangpai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: QrScan(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.deepPurpleAccent[100],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async{
            BarcodeCapture result = await Get.to(Scan());
            print("扫描结果：" + result.barcodes.first. rawValue.toString());
          },
          child: Text("点击扫码"),
        ),
      ),
    );
  }
}
