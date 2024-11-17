import 'package:json_annotation/json_annotation.dart';

part 'exam_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamExamListResponse {

  ExamExamListResponse(
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


  factory ExamExamListResponse.fromJson(Map<String, dynamic> json) => _$ExamExamListResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExamExamListResponseToJson(this);
  
  factory ExamExamListResponse.emptyInstance() => ExamExamListResponse(status: 0, code: 0, message: "", data: Data.emptyInstance());
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
class ExamList {

  ExamList(
      {required this.id,
      required this.courseid,
      required this.dirid,
      required this.title,
      this.attachment,
      required this.publishtype,
      required this.limittype,
      required this.type,
      required this.fullscore,
      required this.begintime,
      required this.endtime,
      required this.createtime,
      required this.timelength,
      required this.uid,
      this.fromid,
      required this.fromtype,
      required this.fallback,
      required this.lastuid,
      required this.viewanswer,
      required this.over,
      required this.display,
      this.solution,
      required this.nohandupscore,
      required this.weight,
      required this.isrand,
      required this.randoption,
      required this.randextra,
      required this.comprehensionrand,
      required this.comprehensionrandoption,
      required this.mulscoretype,
      required this.fillscoretype,
      required this.casesensitive,
      required this.style,
      required this.viewtestpaper,
      required this.allowcopy,
      required this.allowpaster,
      required this.allowmultidevice,
      required this.cutscreen,
      required this.share,
      this.endmqsid,
      required this.beginmqsid,
      required this.randtype,
      required this.issys,
      required this.status,
      required this.deltime,
      required this.runing,
      required this.testpaperid,
      required this.contenttype,
      required this.rehandup,
      required this.removeHtmlTagDescription,
      required this.removeHtmlTagDescriptionReservedImg,
      required this.testpaperType,
      required this.lessonlink,
      required this.submitState,
      required this.index,
      required this.itemType,
      required this.activitylabel,
      required this.copyright,
      required this.evaluateState});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;

  @JsonKey(name: "dirid", defaultValue: "")
  String dirid;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "attachment")
  dynamic attachment;

  @JsonKey(name: "publishtype", defaultValue: "")
  String publishtype;

  @JsonKey(name: "limittype", defaultValue: "")
  String limittype;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "fullscore", defaultValue: "")
  String fullscore;

  @JsonKey(name: "begintime", defaultValue: "")
  String begintime;

  @JsonKey(name: "endtime", defaultValue: "")
  String endtime;

  @JsonKey(name: "createtime", defaultValue: "")
  String createtime;

  @JsonKey(name: "timelength", defaultValue: "")
  String timelength;

  @JsonKey(name: "uid", defaultValue: "")
  String uid;

  @JsonKey(name: "fromid")
  dynamic fromid;

  @JsonKey(name: "fromtype", defaultValue: "")
  String fromtype;

  @JsonKey(name: "fallback", defaultValue: "")
  String fallback;

  @JsonKey(name: "lastuid", defaultValue: "")
  String lastuid;

  @JsonKey(name: "viewanswer", defaultValue: "")
  String viewanswer;

  @JsonKey(name: "over", defaultValue: 0)
  int over;

  @JsonKey(name: "display", defaultValue: "")
  String display;

  @JsonKey(name: "solution")
  dynamic solution;

  @JsonKey(name: "nohandupscore", defaultValue: "")
  String nohandupscore;

  @JsonKey(name: "weight", defaultValue: "")
  String weight;

  @JsonKey(name: "isrand", defaultValue: "")
  String isrand;

  @JsonKey(name: "randoption", defaultValue: "")
  String randoption;

  @JsonKey(name: "randextra", defaultValue: "")
  String randextra;

  @JsonKey(name: "comprehensionrand", defaultValue: "")
  String comprehensionrand;

  @JsonKey(name: "comprehensionrandoption", defaultValue: "")
  String comprehensionrandoption;

  @JsonKey(name: "mulscoretype", defaultValue: "")
  String mulscoretype;

  @JsonKey(name: "fillscoretype", defaultValue: "")
  String fillscoretype;

  @JsonKey(name: "casesensitive", defaultValue: "")
  String casesensitive;

  @JsonKey(name: "style", defaultValue: "")
  String style;

  @JsonKey(name: "viewtestpaper", defaultValue: "")
  String viewtestpaper;

  @JsonKey(name: "allowcopy", defaultValue: "")
  String allowcopy;

  @JsonKey(name: "allowpaster", defaultValue: "")
  String allowpaster;

  @JsonKey(name: "allowmultidevice", defaultValue: "")
  String allowmultidevice;

  @JsonKey(name: "cutscreen", defaultValue: "")
  String cutscreen;

  @JsonKey(name: "share", defaultValue: 0)
  int share;

  @JsonKey(name: "endmqsid")
  dynamic endmqsid;

  @JsonKey(name: "beginmqsid", defaultValue: "")
  String beginmqsid;

  @JsonKey(name: "randtype", defaultValue: "")
  String randtype;

  @JsonKey(name: "issys", defaultValue: "")
  String issys;

  @JsonKey(name: "status", defaultValue: "")
  String status;

  @JsonKey(name: "deltime", defaultValue: "")
  String deltime;

  @JsonKey(name: "runing", defaultValue: 0)
  int runing;

  @JsonKey(name: "testpaperid", defaultValue: "")
  String testpaperid;

  @JsonKey(name: "contenttype", defaultValue: 0)
  int contenttype;

  @JsonKey(name: "rehandup", defaultValue: "")
  String rehandup;

  @JsonKey(name: "removeHtmlTagDescription", defaultValue: "")
  String removeHtmlTagDescription;

  @JsonKey(name: "removeHtmlTagDescriptionReservedImg", defaultValue: "")
  String removeHtmlTagDescriptionReservedImg;

  @JsonKey(name: "testpaperType", defaultValue: 0)
  int testpaperType;

  @JsonKey(name: "lessonlink", defaultValue: [])
  List<Lessonlink> lessonlink;

  @JsonKey(name: "submit_state", defaultValue: 0)
  int submitState;

  @JsonKey(name: "index", defaultValue: "")
  String index;

  @JsonKey(name: "item_type", defaultValue: 0)
  int itemType;

  @JsonKey(name: "activitylabel", defaultValue: "")
  String activitylabel;

  @JsonKey(name: "copyright", defaultValue: "")
  String copyright;

  @JsonKey(name: "evaluateState", defaultValue: 0)
  int evaluateState;


  factory ExamList.fromJson(Map<String, dynamic> json) => _$ExamListFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExamListToJson(this);
  
  factory ExamList.emptyInstance() => ExamList(id: "", courseid: "", dirid: "", title: "", publishtype: "", limittype: "", type: "", fullscore: "", begintime: "", endtime: "", createtime: "", timelength: "", uid: "", fromtype: "", fallback: "", lastuid: "", viewanswer: "", over: 0, display: "", nohandupscore: "", weight: "", isrand: "", randoption: "", randextra: "", comprehensionrand: "", comprehensionrandoption: "", mulscoretype: "", fillscoretype: "", casesensitive: "", style: "", viewtestpaper: "", allowcopy: "", allowpaster: "", allowmultidevice: "", cutscreen: "", share: 0, beginmqsid: "", randtype: "", issys: "", status: "", deltime: "", runing: 0, testpaperid: "", contenttype: 0, rehandup: "", removeHtmlTagDescription: "", removeHtmlTagDescriptionReservedImg: "", testpaperType: 0, lessonlink: [], submitState: 0, index: "", itemType: 0, activitylabel: "", copyright: "", evaluateState: 0);
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.currentPage,
      required this.pageSize,
      required this.pageTotal,
      required this.total,
      required this.list,
      required this.sort});

  @JsonKey(name: "currentPage", defaultValue: 0)
  int currentPage;

  @JsonKey(name: "pageSize", defaultValue: 0)
  int pageSize;

  @JsonKey(name: "pageTotal", defaultValue: 0)
  int pageTotal;

  @JsonKey(name: "total", defaultValue: 0)
  int total;

  @JsonKey(name: "list", defaultValue: [])
  List<ExamList> list;

  @JsonKey(name: "sort", defaultValue: [])
  List sort;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(currentPage: 0, pageSize: 0, pageTotal: 0, total: 0, list: [], sort: []);
}


