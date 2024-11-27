import 'package:html_unescape/html_unescape.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_question.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamQuestion {
  ExamQuestion(
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

  factory ExamQuestion.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$ExamQuestionToJson(this);

  factory ExamQuestion.emptyInstance() =>
      ExamQuestion(status: 0, code: 0, message: "", data: Data.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Options {
  Options(
      {required this.id,
      required this.subjectid,
      required this.title,
      required this.status,
      required this.selected,
      required this.deltime});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "subjectid", defaultValue: "")
  String subjectid;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "status", defaultValue: "")
  String status;

  @JsonKey(name: "deltime", defaultValue: "")
  String deltime;

  @JsonKey(ignore: true, defaultValue: false)
  bool selected;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);

  factory Options.emptyInstance() =>
      Options(id: "", subjectid: "", title: "", status: "", deltime: "", selected: false);
}

@JsonSerializable(explicitToJson: true)
class Lists {
  Lists(
      {required this.id,
      required this.title,
      required this.type,
      required this.score,
      required this.sort,
      this.attachment,
      required this.difficulty,
      required this.replenishtype,
      required this.extract,
      required this.options,
      this.content,
      required this.imgUrls,
      this.myanswer});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "score", defaultValue: "")
  String score;

  @JsonKey(name: "sort", defaultValue: "")
  String sort;

  @JsonKey(name: "attachment")
  dynamic attachment;

  @JsonKey(name: "difficulty", defaultValue: "")
  String difficulty;

  @JsonKey(name: "replenishtype", defaultValue: "")
  String replenishtype;

  @JsonKey(name: "extract", defaultValue: false)
  bool extract;

  @JsonKey(name: "options", defaultValue: [])
  List<Options> options;

  @JsonKey(name: "myanswer")
  String? myanswer;

  @JsonKey(ignore: true, defaultValue: '')
  String? content;

  @JsonKey(ignore: true, defaultValue: [])
  List<String> imgUrls;

  factory Lists.fromJson(Map<String, dynamic> json) => _$ListsFromJson(json);

  Map<String, dynamic> toJson() => _$ListsToJson(this);

  factory Lists.emptyInstance() => Lists(
      id: "",
      title: "",
      type: "",
      score: "",
      sort: "",
      difficulty: "",
      replenishtype: "",
      extract: false,
      options: [],
      imgUrls: []);
}

@JsonSerializable(explicitToJson: true)
class Cutscreen {
  Cutscreen(
      {required this.cutscreenState,
      required this.testpaperAllCount,
      required this.studentCount,
      required this.lastCount,
      required this.testCode,
      required this.isFirstJoin});

  @JsonKey(name: "cutscreenState", defaultValue: 0)
  int cutscreenState;

  @JsonKey(name: "testpaperAllCount", defaultValue: 0)
  int testpaperAllCount;

  @JsonKey(name: "studentCount", defaultValue: 0)
  int studentCount;

  @JsonKey(name: "lastCount", defaultValue: 0)
  int lastCount;

  @JsonKey(name: "testCode", defaultValue: "")
  String testCode;

  @JsonKey(name: "isFirstJoin", defaultValue: 0)
  int isFirstJoin;

  factory Cutscreen.fromJson(Map<String, dynamic> json) =>
      _$CutscreenFromJson(json);

  Map<String, dynamic> toJson() => _$CutscreenToJson(this);

  factory Cutscreen.emptyInstance() => Cutscreen(
      cutscreenState: 0,
      testpaperAllCount: 0,
      studentCount: 0,
      lastCount: 0,
      testCode: "",
      isFirstJoin: 0);
}

@JsonSerializable(explicitToJson: true)
class Testpaper {
  Testpaper(
      {required this.begintime,
      required this.endtime,
      required this.timelength,
      required this.title,
      required this.totalCount,
      required this.totalScore,
      required this.style,
      required this.allowcopy,
      required this.allowpaster,
      required this.fallback,
      required this.countDown,
      required this.viewanswer,
      required this.cutscreen,
      required this.over,
      required this.isrand,
      required this.randextra,
      required this.randtype});

  @JsonKey(name: "begintime", defaultValue: "")
  String begintime;

  @JsonKey(name: "endtime", defaultValue: "")
  String endtime;

  @JsonKey(name: "timelength", defaultValue: 0)
  int timelength;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "totalCount", defaultValue: 0)
  int totalCount;

  @JsonKey(name: "totalScore", defaultValue: 0)
  int totalScore;

  @JsonKey(name: "style", defaultValue: "")
  String style;

  @JsonKey(name: "allowcopy", defaultValue: "")
  String allowcopy;

  @JsonKey(name: "allowpaster", defaultValue: "")
  String allowpaster;

  @JsonKey(name: "fallback", defaultValue: "")
  String fallback;

  @JsonKey(name: "countDown", defaultValue: 0)
  int countDown;

  @JsonKey(name: "viewanswer", defaultValue: "")
  String viewanswer;

  @JsonKey(name: "cutscreen", defaultValue: Cutscreen.emptyInstance)
  Cutscreen cutscreen;

  @JsonKey(name: "over", defaultValue: "")
  String over;

  @JsonKey(name: "isrand", defaultValue: "")
  String isrand;

  @JsonKey(name: "randextra", defaultValue: "")
  String randextra;

  @JsonKey(name: "randtype", defaultValue: "")
  String randtype;

  factory Testpaper.fromJson(Map<String, dynamic> json) =>
      _$TestpaperFromJson(json);

  Map<String, dynamic> toJson() => _$TestpaperToJson(this);

  factory Testpaper.emptyInstance() => Testpaper(
      begintime: "",
      endtime: "",
      timelength: 0,
      title: "",
      totalCount: 0,
      totalScore: 0,
      style: "",
      allowcopy: "",
      allowpaster: "",
      fallback: "",
      countDown: 0,
      viewanswer: "",
      cutscreen: Cutscreen.emptyInstance(),
      over: "",
      isrand: "",
      randextra: "",
      randtype: "");
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {required this.lists,
      required this.handupState,
      required this.rehandup,
      required this.testpaper,
      required this.remainTimes,
      this.begintime,
      required this.fallbackNumber});

  @JsonKey(name: "lists", defaultValue: [])
  List<Lists> lists;

  @JsonKey(name: "handupState", defaultValue: "")
  String handupState;

  @JsonKey(name: "rehandup", defaultValue: "")
  String rehandup;

  @JsonKey(name: "testpaper", defaultValue: Testpaper.emptyInstance)
  Testpaper testpaper;

  @JsonKey(name: "remainTimes", defaultValue: 0)
  int remainTimes;

  @JsonKey(name: "begintime")
  dynamic begintime;

  @JsonKey(name: "fallback_number", defaultValue: 0)
  int fallbackNumber;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.emptyInstance() => Data(
      lists: [],
      handupState: "",
      rehandup: "",
      testpaper: Testpaper.emptyInstance(),
      remainTimes: 0,
      fallbackNumber: 0);
}
