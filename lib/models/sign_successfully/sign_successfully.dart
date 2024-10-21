import 'package:json_annotation/json_annotation.dart';

part 'sign_successfully.g.dart';

@JsonSerializable(explicitToJson: true)
class SignSuccessfully {

  SignSuccessfully(
      {required this.status,
      required this.code,
      required this.message,
      required this.data});

  @JsonKey(name: "status", defaultValue: 0)
  int status;

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "message", defaultValue: "")
  String message;

  @JsonKey(name: "data", defaultValue: Data.emptyInstance)
  Data data;


  factory SignSuccessfully.fromJson(Map<String, dynamic> json) => _$SignSuccessfullyFromJson(json);
  
  Map<String, dynamic> toJson() => _$SignSuccessfullyToJson(this);
  
  factory SignSuccessfully.emptyInstance() => SignSuccessfully(status: 0, code: 0, message: "", data: Data.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.ipconflict,
      required this.attenceid,
      required this.courseid,
      required this.info,
      required this.status,
      required this.coursename,
      required this.state});

  @JsonKey(name: "ipconflict", defaultValue: 0)
  int ipconflict;

  @JsonKey(name: "attenceid", defaultValue: "")
  String attenceid;

  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;

  @JsonKey(name: "info", defaultValue: "")
  String info;

  @JsonKey(name: "status", defaultValue: 0)
  int status;

  @JsonKey(name: "coursename", defaultValue: "")
  String coursename;

  @JsonKey(name: "state", defaultValue: 0)
  int state;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(ipconflict: 0, attenceid: "", courseid: "", info: "", status: 0, coursename: "", state: 0);
}


