import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/profiles.dart';
import 'package:fuckketangpai/tools/sign.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:web_socket_channel/io.dart';
import 'scan.dart';
import '../selfwidgets/Toast.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  RxString text = "扫码结果".obs;
  IOWebSocketChannel? channel;
  TextEditingController controller = TextEditingController();
  RxBool connectionState = false.obs;
  RxInt userNumbers = 0.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    channel == null ? () => null : channel!.sink.close();
    print(123456789200000);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(
                  () => Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 20,
                          height: 20,
                          color: connectionState.value
                              ? Colors.greenAccent
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '连接状态: ${connectionState.value ? '正常连接' : '未连接'}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Obx(() => Text(
                          '在线人数: ${userNumbers.value}',
                          style: TextStyle(fontSize: 20),
                        ))),
              ),
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    BarcodeCapture result = await Get.to(Scan());
                    senMessage(result.barcodes.first.rawValue.toString());
                    text.value = result.barcodes.first.rawValue.toString();
                    sign(result.barcodes.first.rawValue.toString());
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    connectionState.value
                        ? Toast('请勿重复连接')
                        : connectToWebSocket();
                  },
                  child: Text('连接服务器')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => controller.value.text.isNotEmpty
                            ? senMessage(controller.value.text)
                            : Toast('不能为空'),
                        child: Text('发送消息')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void connectToWebSocket() {
    try {
      channel = IOWebSocketChannel.connect('ws://172.16.0.108:9745/connection');
      channel?.stream.listen(
        (event) {
          connectionState.value = true;
          Map<String, dynamic> result = jsonDecode(event);
          print(result['content'] + '\n' + result['type']);
          if (result['type'] == 'sign') {
            sign(result['content']);
            Toast(result['content']);
          } else if (result['type'] == 'onlineNums') {
            userNumbers.value = int.parse(result['content']);
          } else if (event == '1') {
            connectionState.value = true;
          } else {
            Toast(result.toString());
          }
        },
        onDone: () {
          if (channel?.closeCode != null) {
            print('WebSocket closed with code: ${channel?.closeCode}');
            connectionState.value = false;
            reconnect();
          } else {
            print('WebSocket closed');
          }
        },
        onError: (error) {
          Toast('连接错误' + error);
          print('WebSocket error: $error');
          connectionState.value = false;
          reconnect();
        },
      );
    } on Exception catch (e) {
      Toast(e.toString());
    }
  }

  void senMessage(String message) {
    channel?.sink.add(message);
  }

  void reconnect() {
    Future.delayed(Duration(seconds: 5), () {
      channel = IOWebSocketChannel.connect('ws://172.16.0.108:9745/connection');
      connectionState.value = true;
    });
  }
}
