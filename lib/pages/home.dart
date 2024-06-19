import 'package:dio/dio.dart' as dios;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckketangpai/Internet/connectWebSocket.dart';
import 'package:fuckketangpai/pages/profiles.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'scan.dart';
import '../selfwidgets/Toast.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  RxString text = "扫码结果".obs;
  late IOWebSocketChannel channel;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
        'ws://172.16.0.108:9745/connection');
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
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
                    channel = IOWebSocketChannel.connect(
                        'ws://172.16.0.108:9745/connection');
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
                        onPressed: () => senMessage(), child: Text('发送消息')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder(stream: channel.stream, builder: (context,snapshot) {
                  if(snapshot.hasData) {
                    Toast(snapshot.data.toString());
                    return Text(snapshot.data.toString());
                  } else return Text('暂无消息');
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void connectToWebSocket() {
    try {
      channel = IOWebSocketChannel.connect('ws://172.16.0.108:9745/connection');
      channel.stream.listen((event) {
        print(event.toString());
        Toast(event.toString());
      });
    } on Exception catch (e) {
      Toast(e.toString());
    }
  }

  void senMessage() {
    if (controller.value.text.isNotEmpty)
      channel.sink.add(controller.value.text);
    else Toast('不能为空');
  }
}
