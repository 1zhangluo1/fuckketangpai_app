import 'package:json_annotation/json_annotation.dart';

part 'local_users.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalUsers {

  LocalUsers(
      {required this.userNumbers,
      required this.users});

  @JsonKey(name: "userNumbers", defaultValue: 0)
  int userNumbers;

  @JsonKey(name: "users", defaultValue: [])
  List<Users> users;


  factory LocalUsers.fromJson(Map<String, dynamic> json) => _$LocalUsersFromJson(json);
  
  Map<String, dynamic> toJson() => _$LocalUsersToJson(this);
  
  factory LocalUsers.emptyInstance() => LocalUsers(userNumbers: 0, users: []);
}

@JsonSerializable(explicitToJson: true)
class Users {

  Users(
      {required this.uid,
      required this.name,
      required this.account,
      required this.password,
      required this.phone,
      required this.signStatus,
      required this.isCourse,
      required this.token});

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "account", defaultValue: "")
  String account;

  @JsonKey(name: "password", defaultValue: "")
  String password;

  @JsonKey(name: "phone", defaultValue: "")
  String phone;

  @JsonKey(name: "signStatus", defaultValue: false)
  bool signStatus;

  @JsonKey(name: "isCourse", defaultValue: "")
  String isCourse;

  @JsonKey(name: "token", defaultValue: "")
  String token;


  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  
  Map<String, dynamic> toJson() => _$UsersToJson(this);
  
  factory Users.emptyInstance() => Users(uid: "", name: "", account: "", password: "", phone: "", signStatus: false, isCourse: "", token: "");
}


