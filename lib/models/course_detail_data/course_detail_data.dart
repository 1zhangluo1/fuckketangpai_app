import 'package:json_annotation/json_annotation.dart';
part 'course_detail_data.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseDetailData {

  CourseDetailData(
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

  @JsonKey(name: "data", defaultValue: CourseInfo.emptyInstance)
  CourseInfo data;


  factory CourseDetailData.fromJson(Map<String, dynamic> json) => _$CourseDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailDataToJson(this);

  factory CourseDetailData.emptyInstance() => CourseDetailData(status: 0, code: 0, message: "", data: CourseInfo.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Teacher {

  Teacher(
      {required this.name,
      required this.avatar});

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;


  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  factory Teacher.emptyInstance() => Teacher(name: "", avatar: "");
}

@JsonSerializable(explicitToJson: true)
class Theme {

  Theme(
      {required this.id,
      required this.bgcolor,
      required this.bannercolor,
      required this.minpic,
      required this.middlepic,
      required this.bigpic,
      this.createtime,
      required this.minarpic,
      required this.bigarpic,
      required this.type,
      this.typedesc,
      required this.version,
      required this.deltime,
      required this.studentbgpic,
      required this.studentminpic,
      required this.teacherbgpic,
      required this.teacherminpic});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "bgcolor", defaultValue: "")
  String bgcolor;

  @JsonKey(name: "bannercolor", defaultValue: "")
  String bannercolor;

  @JsonKey(name: "minpic", defaultValue: "")
  String minpic;

  @JsonKey(name: "middlepic", defaultValue: "")
  String middlepic;

  @JsonKey(name: "bigpic", defaultValue: "")
  String bigpic;

  @JsonKey(name: "createtime")
  dynamic createtime;

  @JsonKey(name: "minarpic", defaultValue: "")
  String minarpic;

  @JsonKey(name: "bigarpic", defaultValue: "")
  String bigarpic;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "typedesc")
  dynamic typedesc;

  @JsonKey(name: "version", defaultValue: "")
  String version;

  @JsonKey(name: "deltime", defaultValue: "")
  String deltime;

  @JsonKey(name: "studentbgpic", defaultValue: "")
  String studentbgpic;

  @JsonKey(name: "studentminpic", defaultValue: "")
  String studentminpic;

  @JsonKey(name: "teacherbgpic", defaultValue: "")
  String teacherbgpic;

  @JsonKey(name: "teacherminpic", defaultValue: "")
  String teacherminpic;


  factory Theme.fromJson(Map<String, dynamic> json) => _$ThemeFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeToJson(this);

  factory Theme.emptyInstance() => Theme(id: "", bgcolor: "", bannercolor: "", minpic: "", middlepic: "", bigpic: "", minarpic: "", bigarpic: "", type: "", version: "", deltime: "", studentbgpic: "", studentminpic: "", teacherbgpic: "", teacherminpic: "");
}

@JsonSerializable(explicitToJson: true)
class EnrollData {

  EnrollData(
      {required this.enrollstate,
      required this.waitAuditCount});

  @JsonKey(name: "enrollstate", defaultValue: "")
  String enrollstate;

  @JsonKey(name: "waitAuditCount", defaultValue: 0)
  int waitAuditCount;


  factory EnrollData.fromJson(Map<String, dynamic> json) => _$EnrollDataFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollDataToJson(this);

  factory EnrollData.emptyInstance() => EnrollData(enrollstate: "", waitAuditCount: 0);
}

@JsonSerializable(explicitToJson: true)
class CourseInfo {

  CourseInfo(
      {required this.coursename,
      required this.uid,
      required this.createtime,
      required this.code,
      required this.cipher,
      required this.classname,
      required this.stopcode,
      required this.studytime,
      required this.teachtype,
      required this.recommendresource,
      required this.forbiddiscuss,
      required this.resourceId,
      required this.classending,
      required this.canvisit,
      required this.teacher,
      required this.administrator,
      required this.studentCount,
      required this.theme,
      required this.groupCount,
      required this.types,
      required this.coid,
      required this.isattest,
      required this.showRecommendChapter,
      required this.enrollData,
      required this.identity});

  @JsonKey(name: "coursename", defaultValue: "")
  String coursename;

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "createtime", defaultValue: "")
  String createtime;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "cipher", defaultValue: "")
  String cipher;

  @JsonKey(name: "classname", defaultValue: "")
  String classname;

  @JsonKey(name: "stopcode", defaultValue: "")
  String stopcode;

  @JsonKey(name: "studytime", defaultValue: "")
  String studytime;

  @JsonKey(name: "teachtype", defaultValue: "")
  String teachtype;

  @JsonKey(name: "recommendresource", defaultValue: "")
  String recommendresource;

  @JsonKey(name: "forbiddiscuss", defaultValue: "")
  String forbiddiscuss;

  @JsonKey(name: "resource_id", defaultValue: "")
  String resourceId;

  @JsonKey(name: "classending", defaultValue: "")
  String classending;

  @JsonKey(name: "canvisit", defaultValue: "")
  String canvisit;

  @JsonKey(name: "teacher", defaultValue: Teacher.emptyInstance)
  Teacher teacher;

  @JsonKey(name: "administrator", defaultValue: 0)
  int administrator;

  @JsonKey(name: "studentCount", defaultValue: 0)
  int studentCount;

  @JsonKey(name: "theme", defaultValue: Theme.emptyInstance)
  Theme theme;

  @JsonKey(name: "groupCount", defaultValue: "")
  String groupCount;

  @JsonKey(name: "types", defaultValue: "")
  String types;

  @JsonKey(name: "coid", defaultValue: 0)
  int coid;

  @JsonKey(name: "isattest", defaultValue: false)
  bool isattest;

  @JsonKey(name: "showRecommendChapter", defaultValue: 0)
  int showRecommendChapter;

  @JsonKey(name: "enrollData", defaultValue: EnrollData.emptyInstance)
  EnrollData enrollData;

  @JsonKey(name: "identity", defaultValue: 0)
  int identity;


  factory CourseInfo.fromJson(Map<String, dynamic> json) => _$CourseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseInfoToJson(this);

  factory CourseInfo.emptyInstance() => CourseInfo(coursename: "", uid: "", createtime: "", code: "", cipher: "", stopcode: "", studytime: "", teachtype: "", recommendresource: "", forbiddiscuss: "", resourceId: "", classending: "", canvisit: "", teacher: Teacher.emptyInstance(), administrator: 0, studentCount: 0, theme: Theme.emptyInstance(), groupCount: "", types: "", coid: 0, isattest: false, showRecommendChapter: 0, enrollData: EnrollData.emptyInstance(), identity: 0, classname: '');
}


