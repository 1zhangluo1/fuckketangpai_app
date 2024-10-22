// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineCourses _$OnlineCoursesFromJson(Map<String, dynamic> json) =>
    OnlineCourses(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnlineCoursesToJson(OnlineCourses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

CourseList _$CourseListFromJson(Map<String, dynamic> json) => CourseList(
      id: json['id'] as String? ?? '',
      coursename: json['coursename'] as String? ?? '',
      classname: json['classname'],
      uid: json['uid'] as String? ?? '',
      isMeeting: (json['is_meeting'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      role: (json['role'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? '',
      minpic: json['minpic'] as String? ?? '',
    );

Map<String, dynamic> _$CourseListToJson(CourseList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coursename': instance.coursename,
      'classname': instance.classname,
      'uid': instance.uid,
      'is_meeting': instance.isMeeting,
      'type': instance.type,
      'role': instance.role,
      'username': instance.username,
      'minpic': instance.minpic,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => CourseList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      banner: json['banner'] as List<dynamic>? ?? [],
      notReadNotifyLists: json['notReadNotifyLists'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'banner': instance.banner,
      'notReadNotifyLists': instance.notReadNotifyLists,
    };
