// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsocketMessage _$WebsocketMessageFromJson(Map<String, dynamic> json) =>
    WebsocketMessage(
      content: json['content'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$WebsocketMessageToJson(WebsocketMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'type': instance.type,
    };
