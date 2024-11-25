// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attence _$AttenceFromJson(Map<String, dynamic> json) => Attence(
      status: (json['status'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CourseSignInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      pageSize: json['pageSize'].toString() as String? ?? '',
      attenceCount: (json['attenceCount'] as num?)?.toInt() ?? 0,
      lateCount: (json['lateCount'] as num?)?.toInt() ?? 0,
      absentCount: (json['absentCount'] as num?)?.toInt() ?? 0,
      pleaseCount: (json['pleaseCount'] as num?)?.toInt() ?? 0,
      privateLeaveCount: (json['privateLeaveCount'] as num?)?.toInt() ?? 0,
      totalPleaseCount: (json['totalPleaseCount'] as num?)?.toInt() ?? 0,
      sickLeaveCount: (json['sickLeaveCount'] as num?)?.toInt() ?? 0,
      statutoryCount: (json['statutoryCount'] as num?)?.toInt() ?? 0,
      leaveEarlyCount: (json['leaveEarlyCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AttenceToJson(Attence instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'pageSize': instance.pageSize,
      'attenceCount': instance.attenceCount,
      'lateCount': instance.lateCount,
      'absentCount': instance.absentCount,
      'pleaseCount': instance.pleaseCount,
      'privateLeaveCount': instance.privateLeaveCount,
      'totalPleaseCount': instance.totalPleaseCount,
      'sickLeaveCount': instance.sickLeaveCount,
      'statutoryCount': instance.statutoryCount,
      'leaveEarlyCount': instance.leaveEarlyCount,
    };

CourseSignInfo _$CourseSignInfoFromJson(Map<String, dynamic> json) =>
    CourseSignInfo(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      createtime: json['createtime'] as String? ?? '',
      checkouttime: json['checkouttime'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      checkinover: json['checkinover'] as String? ?? '',
      checkoutover: json['checkoutover'] as String? ?? '',
      checkinovertime: json['checkinovertime'] as String? ?? '',
      checkoutovertime: json['checkoutovertime'] as String? ?? '',
      overtime: json['overtime'] as String? ?? '',
      state: json['state'] as String? ?? '',
      studentattenceCreatetime:
          json['studentattence_createtime'] as String? ?? '',
      studentattenceUpdatetime:
          json['studentattence_updatetime'] as String? ?? '',
      ip: json['ip'] as String?,
      nosign: json['nosign'] as String? ?? '',
      signTime: (json['signTime'] is String ? int.tryParse(json['signTime']) : json['signTime'] as int?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CourseSignInfoToJson(CourseSignInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'createtime': instance.createtime,
      'checkouttime': instance.checkouttime,
      'duration': instance.duration,
      'checkinover': instance.checkinover,
      'checkoutover': instance.checkoutover,
      'checkinovertime': instance.checkinovertime,
      'checkoutovertime': instance.checkoutovertime,
      'overtime': instance.overtime,
      'state': instance.state,
      'studentattence_createtime': instance.studentattenceCreatetime,
      'studentattence_updatetime': instance.studentattenceUpdatetime,
      'ip': instance.ip,
      'nosign': instance.nosign,
      'signTime': instance.signTime,
    };
