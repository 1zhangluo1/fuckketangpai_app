// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_course_signing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCourseSigning _$CheckCourseSigningFromJson(Map<String, dynamic> json) =>
    CheckCourseSigning(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckCourseSigningToJson(CheckCourseSigning instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Lists _$ListsFromJson(Map<String, dynamic> json) => Lists(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      createtime: json['createtime'] as String? ?? '',
    );

Map<String, dynamic> _$ListsToJson(Lists instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'createtime': instance.createtime,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      status: (json['status'] as num?)?.toInt() ?? 0,
      lists: (json['lists'] as List<dynamic>?)
              ?.map((e) => Lists.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'status': instance.status,
      'lists': instance.lists.map((e) => e.toJson()).toList(),
    };
