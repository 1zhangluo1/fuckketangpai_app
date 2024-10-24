import 'dart:convert';

import 'package:fuckketangpai/models/websocket_message/websocket_message.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketUtils {

  WebSocketChannel? _channel;

  sendMessage({required WebsocketMessage message}) {
    final jsonMessage = jsonEncode(message);
    if (_channel != null) {
      _channel!.sink.add(jsonMessage);
    } else {
      throw Exception(
        'websocket管道为空'
      );
    }
  }

  bool checkConnection({required WebSocketChannel channel}) {
    if (channel != null) return (channel.closeCode == null) ? true : false;
    else return false;
  }

  init({required WebSocketChannel channel}) {
    _channel = channel;
  }

  WebSocketUtils._create();

  static WebSocketUtils? _instance;

  factory WebSocketUtils.get() => _instance ??= WebSocketUtils._create();

}