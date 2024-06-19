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
class VipObject {

  VipObject(
      {required this.coid,
      required this.vip,
      required this.triplescreen,
      required this.jigouVip});

  @JsonKey(name: "coid", defaultValue: 0)
  int coid;

  @JsonKey(name: "vip", defaultValue: 0)
  int vip;

  @JsonKey(name: "triplescreen", defaultValue: 0)
  int triplescreen;

  @JsonKey(name: "jigouVip", defaultValue: [])
  List jigouVip;


  factory VipObject.fromJson(Map<String, dynamic> json) => _$VipObjectFromJson(json);
  
  Map<String, dynamic> toJson() => _$VipObjectToJson(this);
  
  factory VipObject.emptyInstance() => VipObject(coid: 0, vip: 0, triplescreen: 0, jigouVip: []);
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.usertype,
      required this.username,
      required this.account,
      required this.avatar,
      required this.stno,
      required this.school,
      this.email,
      required this.mobile,
      this.department,
      required this.teachcourseid,
      required this.isenterprise,
      required this.coid,
      required this.vipObject,
      required this.token,
      required this.oldtoken,
      required this.uid,
      required this.isvip,
      required this.setting,
      required this.mobileUrl,
      required this.bindWechat,
      required this.coidAdmin});

  @JsonKey(name: "usertype", defaultValue: "")
  String usertype;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "account", defaultValue: "")
  String account;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "stno", defaultValue: "")
  String stno;

  @JsonKey(name: "school", defaultValue: "")
  String school;

  @JsonKey(name: "email")
  dynamic email;

  @JsonKey(name: "mobile", defaultValue: "")
  String mobile;

  @JsonKey(name: "department")
  dynamic department;

  @JsonKey(name: "teachcourseid", defaultValue: "")
  String teachcourseid;

  @JsonKey(name: "isenterprise", defaultValue: 0)
  int isenterprise;

  @JsonKey(name: "coid", defaultValue: 0)
  int coid;

  @JsonKey(name: "vipObject", defaultValue: VipObject.emptyInstance)
  VipObject vipObject;

  @JsonKey(name: "token", defaultValue: "")
  String token;

  @JsonKey(name: "oldtoken", defaultValue: "")
  String oldtoken;

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "isvip", defaultValue: 0)
  int isvip;

  @JsonKey(name: "setting", defaultValue: "")
  String setting;

  @JsonKey(name: "mobile_url", defaultValue: "")
  String mobileUrl;

  @JsonKey(name: "bindWechat", defaultValue: false)
  bool bindWechat;

  @JsonKey(name: "coidAdmin", defaultValue: 0)
  int coidAdmin;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(usertype: "", username: "", account: "", avatar: "", stno: "", school: "", mobile: "", teachcourseid: "", isenterprise: 0, coid: 0, vipObject: VipObject.emptyInstance(), token: "", oldtoken: "", uid: "", isvip: 0, setting: "", mobileUrl: "", bindWechat: false, coidAdmin: 0);
}


