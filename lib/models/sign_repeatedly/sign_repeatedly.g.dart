// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_repeatedly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignRepeatedly _$SignRepeatedlyFromJson(Map<String, dynamic> json) =>
    SignRepeatedly(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignRepeatedlyToJson(SignRepeatedly instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      ipconflict: (json['ipconflict'] as num?)?.toInt() ?? 0,
      attenceid: json['attenceid'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      info: json['info'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
      coursename: json['coursename'] as String? ?? '',
      state: (json['state'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ipconflict': instance.ipconflict,
      'attenceid': instance.attenceid,
      'courseid': instance.courseid,
      'info': instance.info,
      'status': instance.status,
      'coursename': instance.coursename,
      'state': instance.state,
    };
