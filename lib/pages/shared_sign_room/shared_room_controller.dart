import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/websocket_message/websocket_message.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SharedRoomController extends GetxController {

  final String url;
  RxString text = "扫码结果".obs;
  late WebSocketChannel channel;
  TextEditingController controller = TextEditingController();
  RxBool connectionState = false.obs;
  RxInt userNumbers = 0.obs;
  FocusNode focusNode = FocusNode();
  Timer? reconnectTimer; // 定义一个 Timer，用于重连
  SharedRoomController(this.url);

  void connect() {
    channel = IOWebSocketChannel.connect(url);
    channel.stream.listen(
          (message) {
            final messageJson = jsonDecode(message);
            final messageFormat = WebsocketMessage.fromJson(messageJson);
            if (messageFormat.type == 'judge_status') {
              connectionState.value = true;
            } else if (messageFormat.type == 'onlineNums') {
              int peopleNums = int.parse(messageFormat.content);
              userNumbers.value = peopleNums;
            }
            Toast(messageFormat.content);
      },
      onError: (error) {
        connectionState.value = false;
        userNumbers.value = 0;
        Toast('WebSocket连接出错:$error');
        handleDisconnect(); // 处理断开连接
      },
      onDone: () {
        userNumbers.value = 0;
        connectionState.value = false;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    connect();
  }

  @override
  void onClose() {
    print('已断开websocket连接');
    reconnectTimer?.cancel();
    channel.sink.close();
    super.onClose();
  }

  void handleDisconnect() {
    reconnectTimer?.cancel(); // 取消现有的重连定时器
    // 启动重连逻辑
    reconnectTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
      try {
        channel.sink.close(); // 关闭现有连接
        connect(); // 重新连接
        timer.cancel(); // 连接成功，取消重连定时器
      } catch (e) {
        connectionState.value = false; // 更新状态
      }
    });
  }

}