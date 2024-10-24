import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/shared_sign_room/shared_room_controller.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../scan.dart';

class SharedRoomPage extends StatefulWidget {
  const SharedRoomPage({super.key});

  @override
  State<SharedRoomPage> createState() => _SharedRoomPageState();
}

class _SharedRoomPageState extends State<SharedRoomPage> {

  final c = Get.put(SharedRoomController('ws://172.16.0.108:9745/connection'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('共享签到房间'),
      ),
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
                        color: c.connectionState.value
                            ? Colors.greenAccent
                            : Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '连接状态: ${c.connectionState.value ? '正常连接' : '未连接'}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(onPressed: () {c.handleDisconnect();}, icon: Icon(Icons.refresh_outlined))
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
                    '在线人数: ${c.userNumbers.value}',
                    style: TextStyle(fontSize: 20),
                  ))),
            ),
            Container(
              margin: EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  BarcodeCapture result = await Get.to(Scan());
                },
                child: Text("点击扫码"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => SelectableText(
                c.text.value,
                focusNode: c.focusNode,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextField(
                      controller: c.controller,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                      // onPressed: () => c.controller.value.text.isNotEmpty
                      //     ? senMessage(message: c.controller.value.text, isSign: false)
                      //     : Toast('不能为空'),
                      child: Text('发送消息')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
