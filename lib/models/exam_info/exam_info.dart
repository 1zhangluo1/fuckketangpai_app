import 'package:json_annotation/json_annotation.dart';

part 'exam_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamInfo {

  ExamInfo(
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


  factory ExamInfo.fromJson(Map<String, dynamic> json) => _$ExamInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExamInfoToJson(this);
  
  factory ExamInfo.emptyInstance() => ExamInfo(status: 0, code: 0, message: "", data: Data.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Cutscreen {

  Cutscreen(
      {required this.cutscreenState,
      required this.testpaperAllCount,
      required this.studentCount,
      required this.lastCount});

  @JsonKey(name: "cutscreenState", defaultValue: 0)
  int cutscreenState;

  @JsonKey(name: "testpaperAllCount", defaultValue: 0)
  int testpaperAllCount;

  @JsonKey(name: "studentCount", defaultValue: 0)
  int studentCount;

  @JsonKey(name: "lastCount", defaultValue: 0)
  int lastCount;


  factory Cutscreen.fromJson(Map<String, dynamic> json) => _$CutscreenFromJson(json);
  
  Map<String, dynamic> toJson() => _$CutscreenToJson(this);
  
  factory Cutscreen.emptyInstance() => Cutscreen(cutscreenState: 0, testpaperAllCount: 0, studentCount: 0, lastCount: 0);
}

@JsonSerializable(explicitToJson: true)
class Lessonlink {

  Lessonlink(
      {required this.type,
      required this.name});

  @JsonKey(name: "type", defaultValue: 0)
  int type;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory Lessonlink.fromJson(Map<String, dynamic> json) => _$LessonlinkFromJson(json);
  
  Map<String, dynamic> toJson() => _$LessonlinkToJson(this);
  
  factory Lessonlink.emptyInstance() => Lessonlink(type: 0, name: "");
}

@JsonSerializable(explicitToJson: true)
class Testpaper {

  Testpaper(
      {required this.id,
      required this.uid,
      required this.courseid,
      required this.title,
      required this.createtime,
      required this.over,
      required this.viewanswer,
      required this.cutscreen,
      required this.display,
      required this.viewtestpaper,
      required this.begintime,
      required this.endtime,
      required this.timelength,
      this.attachment,
      required this.description,
      required this.type,
      required this.publishtype,
      required this.handupState,
      required this.rehandup,
      required this.testpaperType,
      required this.lessonlink,
      required this.totalScore,
      required this.subjectCount,
      required this.consumption,
      required this.submitStatus,
      required this.score,
      required this.submitState,
      required this.totalScore2,
      required this.nickname,
      required this.avatar,
      required this.activitylabel,
      required this.copyright});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "createtime", defaultValue: "")
  String createtime;

  @JsonKey(name: "over", defaultValue: "")
  String over;

  @JsonKey(name: "viewanswer", defaultValue: "")
  String viewanswer;

  @JsonKey(name: "cutscreen", defaultValue: Cutscreen.emptyInstance)
  Cutscreen cutscreen;

  @JsonKey(name: "display", defaultValue: "")
  String display;

  @JsonKey(name: "viewtestpaper", defaultValue: "")
  String viewtestpaper;

  @JsonKey(name: "begintime", defaultValue: "")
  String begintime;

  @JsonKey(name: "endtime", defaultValue: "")
  String endtime;

  @JsonKey(name: "timelength", defaultValue: 0)
  int timelength;

  @JsonKey(name: "attachment")
  dynamic attachment;

  @JsonKey(name: "description", defaultValue: "")
  String description;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "publishtype", defaultValue: "")
  String publishtype;

  @JsonKey(name: "handupState", defaultValue: "")
  String handupState;

  @JsonKey(name: "rehandup", defaultValue: "")
  String rehandup;

  @JsonKey(name: "testpaperType", defaultValue: 0)
  int testpaperType;

  @JsonKey(name: "lessonlink", defaultValue: [])
  List<Lessonlink> lessonlink;

  @JsonKey(name: "totalScore", defaultValue: "")
  String totalScore;

  @JsonKey(name: "subjectCount", defaultValue: 0)
  int subjectCount;

  @JsonKey(name: "consumption", defaultValue: "")
  String consumption;

  @JsonKey(name: "submit_status", defaultValue: 0)
  int submitStatus;

  @JsonKey(name: "score", defaultValue: "")
  String score;

  @JsonKey(name: "submit_state", defaultValue: 0)
  int submitState;

  @JsonKey(name: "total_score", defaultValue: "")
  String totalScore2;

  @JsonKey(name: "nickname", defaultValue: "")
  String nickname;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "activitylabel", defaultValue: "")
  String activitylabel;

  @JsonKey(name: "copyright", defaultValue: "")
  String copyright;


  factory Testpaper.fromJson(Map<String, dynamic> json) => Testpaper(
    id: json['id'] as String? ?? '',
    uid: json['uid'] as String? ?? '',
    courseid: json['courseid'] as String? ?? '',
    title: json['title'] as String? ?? '',
    createtime: json['createtime'] as String? ?? '',
    over: json['over'].toString() as String? ?? '',
    viewanswer: json['viewanswer'] as String? ?? '',
    cutscreen: json['cutscreen'] == null
        ? Cutscreen.emptyInstance()
        : Cutscreen.fromJson(json['cutscreen'] as Map<String, dynamic>),
    display: json['display'] as String? ?? '',
    viewtestpaper: json['viewtestpaper'] as String? ?? '',
    begintime: json['begintime'] as String? ?? '',
    endtime: json['endtime'] as String? ?? '',
    timelength: ((json['timelength'] is String ? int.tryParse(json['timelength']) : json['timelength']) as num?)?.toInt() ?? 0,
    attachment: json['attachment'],
    description: json['description'] as String? ?? '',
    type: json['type'] as String? ?? '',
    publishtype: json['publishtype'] as String? ?? '',
    handupState: json['handupState'] as String? ?? '',
    rehandup: json['rehandup'] as String? ?? '',
    testpaperType: (json['testpaperType'] as num?)?.toInt() ?? 0,
    lessonlink: (json['lessonlink'] as List<dynamic>?)
        ?.map((e) => Lessonlink.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [],
    totalScore: json['totalScore'] as String? ?? '',
    subjectCount: (json['subjectCount'] as num?)?.toInt() ?? 0,
    consumption: json['consumption'] as String? ?? '',
    submitStatus: (json['submit_status'] as num?)?.toInt() ?? 0,
    score: json['score'] as String? ?? '',
    submitState: (json['submit_state'] as num?)?.toInt() ?? 0,
    totalScore2: json['total_score'] as String? ?? '',
    nickname: json['nickname'] as String? ?? '',
    avatar: json['avatar'] as String? ?? '',
    activitylabel: json['activitylabel'] as String? ?? '',
    copyright: json['copyright'] as String? ?? '',
  );
  
  Map<String, dynamic> toJson() => _$TestpaperToJson(this);
  
  factory Testpaper.emptyInstance() => Testpaper(id: "", uid: "", courseid: "", title: "", createtime: "", over: "", viewanswer: "", cutscreen: Cutscreen.emptyInstance(), display: "", viewtestpaper: "", begintime: "", endtime: "", timelength: 0, description: "", type: "", publishtype: "", handupState: "", rehandup: "", testpaperType: 0, lessonlink: [], totalScore: "", subjectCount: 0, consumption: "", submitStatus: 0, score: "", submitState: 0, totalScore2: "", nickname: "", avatar: "", activitylabel: "", copyright: "");
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.testpaper});

  @JsonKey(name: "testpaper", defaultValue: Testpaper.emptyInstance)
  Testpaper testpaper;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(testpaper: Testpaper.emptyInstance());
}


