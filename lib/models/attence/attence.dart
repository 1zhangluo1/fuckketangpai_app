import 'package:json_annotation/json_annotation.dart';

part 'attence.g.dart';

@JsonSerializable(explicitToJson: true)
class Attence {

  Attence(
      {required this.status,
      required this.data,
      required this.total,
      required this.pageSize,
      required this.attenceCount,
      required this.lateCount,
      required this.absentCount,
      required this.pleaseCount,
      required this.privateLeaveCount,
      required this.totalPleaseCount,
      required this.sickLeaveCount,
      required this.statutoryCount,
      required this.leaveEarlyCount});

  @JsonKey(name: "status", defaultValue: 0)
  int status;

  @JsonKey(name: "data", defaultValue: [])
  List<CourseSignInfo> data;

  @JsonKey(name: "total", defaultValue: 0)
  int total;

  @JsonKey(name: "pageSize", defaultValue: "")
  String pageSize;

  @JsonKey(name: "attenceCount", defaultValue: 0)
  int attenceCount;

  @JsonKey(name: "lateCount", defaultValue: 0)
  int lateCount;

  @JsonKey(name: "absentCount", defaultValue: 0)
  int absentCount;

  @JsonKey(name: "pleaseCount", defaultValue: 0)
  int pleaseCount;

  @JsonKey(name: "privateLeaveCount", defaultValue: 0)
  int privateLeaveCount;

  @JsonKey(name: "totalPleaseCount", defaultValue: 0)
  int totalPleaseCount;

  @JsonKey(name: "sickLeaveCount", defaultValue: 0)
  int sickLeaveCount;

  @JsonKey(name: "statutoryCount", defaultValue: 0)
  int statutoryCount;

  @JsonKey(name: "leaveEarlyCount", defaultValue: 0)
  int leaveEarlyCount;


  @override
  String toString() {
    return 'Attence{status: $status, total: $total, attenceCount: $attenceCount, lateCount: $lateCount, absentCount: $absentCount, pleaseCount: $pleaseCount, privateLeaveCount: $privateLeaveCount, totalPleaseCount: $totalPleaseCount, sickLeaveCount: $sickLeaveCount, statutoryCount: $statutoryCount, leaveEarlyCount: $leaveEarlyCount}';
  }

  factory Attence.fromJson(Map<String, dynamic> json) => _$AttenceFromJson(json);
  
  Map<String, dynamic> toJson() => _$AttenceToJson(this);
  
  factory Attence.emptyInstance() => Attence(status: 0, data: [], total: 0, pageSize: "", attenceCount: 0, lateCount: 0, absentCount: 0, pleaseCount: 0, privateLeaveCount: 0, totalPleaseCount: 0, sickLeaveCount: 0, statutoryCount: 0, leaveEarlyCount: 0);
}

@JsonSerializable(explicitToJson: true)
class CourseSignInfo {

  CourseSignInfo(
      {required this.id,
      required this.title,
      required this.type,
      required this.createtime,
      required this.checkouttime,
      required this.duration,
      required this.checkinover,
      required this.checkoutover,
      required this.checkinovertime,
      required this.checkoutovertime,
      required this.overtime,
      required this.state,
      required this.studentattenceCreatetime,
      required this.studentattenceUpdatetime,
      this.ip,
      required this.nosign,
      required this.signTime});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "createtime", defaultValue: "")
  String createtime;

  @JsonKey(name: "checkouttime", defaultValue: "")
  String checkouttime;

  @JsonKey(name: "duration", defaultValue: "")
  String duration;

  @JsonKey(name: "checkinover", defaultValue: "")
  String checkinover;

  @JsonKey(name: "checkoutover", defaultValue: "")
  String checkoutover;

  @JsonKey(name: "checkinovertime", defaultValue: "")
  String checkinovertime;

  @JsonKey(name: "checkoutovertime", defaultValue: "")
  String checkoutovertime;

  @JsonKey(name: "overtime", defaultValue: "")
  String overtime;

  @JsonKey(name: "state", defaultValue: "")
  String state;

  @JsonKey(name: "studentattence_createtime", defaultValue: "")
  String studentattenceCreatetime;

  @JsonKey(name: "studentattence_updatetime", defaultValue: "")
  String studentattenceUpdatetime;

  @JsonKey(name: "ip")
  String? ip;

  @JsonKey(name: "nosign", defaultValue: "")
  String nosign;

  @JsonKey(name: "signTime", defaultValue: 0)
  int signTime;


  factory CourseSignInfo.fromJson(Map<String, dynamic> json) => _$CourseSignInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$CourseSignInfoToJson(this);
  
  factory CourseSignInfo.emptyInstance() => CourseSignInfo(id: "", title: "", type: "", createtime: "", checkouttime: "", duration: "", checkinover: "", checkoutover: "", checkinovertime: "", checkoutovertime: "", overtime: "", state: "", studentattenceCreatetime: "", studentattenceUpdatetime: "", nosign: "", signTime: 0);
}


