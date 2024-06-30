import 'package:json_annotation/json_annotation.dart';

part 'getUserInfos.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUserInfos {

  GetUserInfos(
      {required this.data});

  @JsonKey(name: "data", defaultValue: Data.emptyInstance)
  Data data;


  factory GetUserInfos.fromJson(Map<String, dynamic> json) => _$GetUserInfosFromJson(json);
  
  Map<String, dynamic> toJson() => _$GetUserInfosToJson(this);
  
  factory GetUserInfos.emptyInstance() => GetUserInfos(data: Data.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class AdditionInfo {

  AdditionInfo(
      {required this.enrolltime,
      required this.grade,
      required this.classno});

  @JsonKey(name: "enrolltime", defaultValue: "")
  String enrolltime;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "classno", defaultValue: "")
  String classno;


  factory AdditionInfo.fromJson(Map<String, dynamic> json) => _$AdditionInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$AdditionInfoToJson(this);
  
  factory AdditionInfo.emptyInstance() => AdditionInfo(enrolltime: "", grade: "", classno: "");
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.uid,
      required this.username,
      required this.avatar,
      this.department,
      required this.usertype,
      this.email,
      required this.stno,
      required this.school,
      required this.account,
      required this.mobile,
      required this.teachcourseid,
      required this.attestInfo,
      required this.openid,
      required this.unionid,
      required this.teachcourse,
      required this.additionInfo});

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "department")
  dynamic department;

  @JsonKey(name: "usertype", defaultValue: "")
  String usertype;

  @JsonKey(name: "email")
  dynamic email;

  @JsonKey(name: "stno", defaultValue: "")
  String stno;

  @JsonKey(name: "school", defaultValue: "")
  String school;

  @JsonKey(name: "account", defaultValue: "")
  String account;

  @JsonKey(name: "mobile", defaultValue: "")
  String mobile;

  @JsonKey(name: "teachcourseid", defaultValue: "")
  String teachcourseid;

  @JsonKey(name: "attestInfo", defaultValue: [])
  List attestInfo;

  @JsonKey(name: "openid", defaultValue: "")
  String openid;

  @JsonKey(name: "unionid", defaultValue: "")
  String unionid;

  @JsonKey(name: "teachcourse", defaultValue: [])
  List teachcourse;

  @JsonKey(name: "additionInfo", defaultValue: AdditionInfo.emptyInstance)
  AdditionInfo additionInfo;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(uid: "", username: "", avatar: "", usertype: "", stno: "", school: "", account: "", mobile: "", teachcourseid: "", attestInfo: [], openid: "", unionid: "", teachcourse: [], additionInfo: AdditionInfo.emptyInstance());
}


