import 'package:json_annotation/json_annotation.dart';

part 'websocket_message.g.dart';

@JsonSerializable(explicitToJson: true)
class WebsocketMessage {

  WebsocketMessage(
      {required this.content,
      required this.type});

  @JsonKey(name: "content", defaultValue: "")
  String content;

  @JsonKey(name: "type", defaultValue: "")
  String type;


  factory WebsocketMessage.fromJson(Map<String, dynamic> json) => _$WebsocketMessageFromJson(json);
  
  Map<String, dynamic> toJson() => _$WebsocketMessageToJson(this);
  
  factory WebsocketMessage.emptyInstance() => WebsocketMessage(content: "", type: "");
}


