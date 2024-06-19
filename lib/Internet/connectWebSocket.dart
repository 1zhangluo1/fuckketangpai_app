import 'package:flutter/cupertino.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/tools/sign.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

late WebSocketChannel channel;

void connectToWebSocket() {
  try {
    channel = IOWebSocketChannel.connect('ws://172.16.0.108:9745/connection');
    channel.stream.listen((event) {
      Toast(event.toString());
    });
  } on Exception catch (e) {
    Toast(e.toString());
  }
}

void senMessage() {
  channel.sink.add('课堂派');
}
