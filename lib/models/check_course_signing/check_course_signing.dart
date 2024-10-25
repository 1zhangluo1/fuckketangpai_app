import 'package:json_annotation/json_annotation.dart';

part 'check_course_signing.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckCourseSigning {

  CheckCourseSigning(
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


  factory CheckCourseSigning.fromJson(Map<String, dynamic> json) => _$CheckCourseSigningFromJson(json);
  
  Map<String, dynamic> toJson() => _$CheckCourseSigningToJson(this);
  
  factory CheckCourseSigning.emptyInstance() => CheckCourseSigning(status: 0, code: 0, message: "", data: Data.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Lists {

  Lists(
      {required this.id,
      required this.title,
      required this.type,
      required this.createtime});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "createtime", defaultValue: "")
  String createtime;


  factory Lists.fromJson(Map<String, dynamic> json) => _$ListsFromJson(json);
  
  Map<String, dynamic> toJson() => _$ListsToJson(this);
  
  factory Lists.emptyInstance() => Lists(id: "", title: "", type: "", createtime: "");
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.status,
      required this.lists});

  @JsonKey(name: "status", defaultValue: 0)
  int status;

  @JsonKey(name: "lists", defaultValue: [])
  List<Lists> lists;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(status: 0, lists: []);
}


