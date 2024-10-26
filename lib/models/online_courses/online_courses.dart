import 'package:json_annotation/json_annotation.dart';

part 'online_courses.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineCourses {

  OnlineCourses(
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


  factory OnlineCourses.fromJson(Map<String, dynamic> json) => _$OnlineCoursesFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineCoursesToJson(this);

  factory OnlineCourses.emptyInstance() => OnlineCourses(status: 0, code: 0, message: "", data: Data.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class CourseList {

  CourseList(
      {required this.id,
      required this.coursename,
      this.classname,
      required this.uid,
      required this.isMeeting,
      required this.type,
      required this.role,
      required this.username,
      required this.minpic});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "coursename", defaultValue: "")
  String coursename;

  @JsonKey(name: "classname")
  dynamic classname;

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "is_meeting", defaultValue: 0)
  int isMeeting;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "role", defaultValue: 0)
  int role;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "minpic", defaultValue: "")
  String minpic;

  @JsonKey(ignore: true)
  int signType = 0;

  @JsonKey(ignore: true)
  String signId = '';


  factory CourseList.fromJson(Map<String, dynamic> json) => _$CourseListFromJson(json);

  Map<String, dynamic> toJson() => _$CourseListToJson(this);

  factory CourseList.emptyInstance() => CourseList(id: "", coursename: "", uid: "", isMeeting: 0, type: "", role: 0, username: "", minpic: "");
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.list,
      required this.total,
      required this.banner,
      required this.notReadNotifyLists});

  @JsonKey(name: "list", defaultValue: [])
  List<CourseList> list;

  @JsonKey(name: "total", defaultValue: 0)
  int total;

  @JsonKey(name: "banner", defaultValue: [])
  List banner;

  @JsonKey(name: "notReadNotifyLists", defaultValue: [])
  List notReadNotifyLists;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.emptyInstance() => Data(list: [], total: 0, banner: [], notReadNotifyLists: []);
}


