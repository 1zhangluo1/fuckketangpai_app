import 'package:json_annotation/json_annotation.dart';

part 'courses_list.g.dart';

@JsonSerializable(explicitToJson: true)
class CoursesList {

  CoursesList(
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

  @JsonKey(name: "data", defaultValue: [])
  List<Course> data;


  factory CoursesList.fromJson(Map<String, dynamic> json) => _$CoursesListFromJson(json);
  
  Map<String, dynamic> toJson() => _$CoursesListToJson(this);
  
  factory CoursesList.emptyInstance() => CoursesList(status: 0, code: 0, message: "", data: []);
}

@JsonSerializable(explicitToJson: true)
class Course {

  Course(
      {required this.id,
      required this.uid,
      required this.issys,
      required this.coursename,
      required this.code,
      required this.stopcode,
      this.classname,
      required this.semester,
      required this.term,
      required this.isrecruit,
      required this.teachtype,
      required this.studytime,
      required this.classending,
      required this.canvisit,
      required this.username,
      required this.avatar,
      required this.minpic,
      required this.middlepic,
      required this.studentbgpic,
      required this.studentminpic,
      required this.teacherbgpic,
      required this.teacherminpic,
      required this.total,
      required this.role,
      required this.neednatureclass,
      required this.needgrade,
      required this.needentrance,
      required this.identity,
      required this.isattest,
      required this.isTop,
      required this.icontype,
      });

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "issys", defaultValue: "")
  String issys;

  @JsonKey(name: "coursename", defaultValue: "")
  String coursename;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "stopcode", defaultValue: 0)
  int stopcode;

  @JsonKey(name: "classname")
  String? classname;

  @JsonKey(name: "semester", defaultValue: "")
  String semester;

  @JsonKey(name: "term", defaultValue: "")
  String term;

  @JsonKey(name: "isrecruit", defaultValue: "")
  String isrecruit;

  @JsonKey(name: "teachtype", defaultValue: "")
  String teachtype;

  @JsonKey(name: "studytime", defaultValue: "")
  String studytime;

  @JsonKey(name: "classending", defaultValue: "")
  String classending;

  @JsonKey(name: "canvisit", defaultValue: "")
  String canvisit;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "minpic", defaultValue: "")
  String minpic;

  @JsonKey(name: "middlepic", defaultValue: "")
  String middlepic;

  @JsonKey(name: "studentbgpic", defaultValue: "")
  String studentbgpic;

  @JsonKey(name: "studentminpic", defaultValue: "")
  String studentminpic;

  @JsonKey(name: "teacherbgpic", defaultValue: "")
  String teacherbgpic;

  @JsonKey(name: "teacherminpic", defaultValue: "")
  String teacherminpic;

  @JsonKey(name: "total", defaultValue: "")
  String total;

  @JsonKey(name: "role", defaultValue: 0)
  int role;

  @JsonKey(name: "neednatureclass", defaultValue: "")
  String neednatureclass;

  @JsonKey(name: "needgrade", defaultValue: "")
  String needgrade;

  @JsonKey(name: "needentrance", defaultValue: "")
  String needentrance;

  @JsonKey(name: "identity", defaultValue: "")
  String identity;

  @JsonKey(name: "isattest", defaultValue: false)
  bool isattest;

  @JsonKey(name: "isTop", defaultValue: 0)
  int isTop;

  @JsonKey(name: "icontype", defaultValue: 0)
  int icontype;

  @JsonKey(ignore: true)
  bool teaching = false;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CourseToJson(this);
  
  factory Course.emptyInstance() => Course(id: "", uid: "", issys: "", coursename: "", code: "", stopcode: 0, semester: "", term: "", isrecruit: "", teachtype: "", studytime: "", classending: "", canvisit: "", username: "", avatar: "", minpic: "", middlepic: "", studentbgpic: "", studentminpic: "", teacherbgpic: "", teacherminpic: "", total: "", role: 0, neednatureclass: "", needgrade: "", needentrance: "", identity: "", isattest: false, isTop: 0, icontype: 0);
}


