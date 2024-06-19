import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckketangpai/pages/profiles.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'scan.dart';
import '../selfwidgets/Toast.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  RxString text = "扫码结果".obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.deepPurpleAccent[100],
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    BarcodeCapture result = await Get.to(Scan());
                    text.value = result.barcodes.first.rawValue.toString();
                    sign(text.value);
                  },
                  child: Text("点击扫码"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() => SelectableText(
                  text.value,
                  focusNode: focusNode,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Profiles(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sign(String params) async {
    String url = 'https://openapiv5.ketangpai.com/AttenceApi/AttenceResult';
    DateTime now = DateTime.now();
    int reqtimestamp = now.millisecondsSinceEpoch ~/ 1000;
    print("timestamp:" + reqtimestamp.toString());
    RegExp ticketidRegExp = RegExp(r'ticketid=([^&]*)');
    String ticketid = ticketidRegExp.firstMatch(params)?.group(1) ?? '';
    RegExp expireRegExp = RegExp(r'expire=([^&]*)');
    String expire = expireRegExp.firstMatch(params)?.group(1) ?? '';
    RegExp signRegExp = RegExp(r'sign=([^&]*)');
    String sign = signRegExp.firstMatch(params)?.group(1) ?? '';
    print("expire:" + expire);
    print("ticketid:" + ticketid);
    print("sign:" + sign);
    final dio = dios.Dio();
    Map<String, dynamic> body = {
      'ticketid': ticketid,
      "expire": expire,
      "sign": sign,
      "reqtimestamp": reqtimestamp
    };
    dio.options.headers = {
      'Content-Type': 'application/json',
      'token': '3ac938c4773acc9cff1fe0427de0d77c40882f8557ae73d775402834a6980fcf',
    };
    dios.Response response = await dio.post(url, data: body,);
    print(response.toString());
    Toast(response.data['data']['info']);
  }
}