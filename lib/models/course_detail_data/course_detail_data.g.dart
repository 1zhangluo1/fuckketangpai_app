// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailData _$CourseDetailDataFromJson(Map<String, dynamic> json) =>
    CourseDetailData(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? CourseInfo.emptyInstance()
          : CourseInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseDetailDataToJson(CourseDetailData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      name: json['name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
    };

Theme _$ThemeFromJson(Map<String, dynamic> json) => Theme(
      id: json['id'] as String? ?? '',
      bgcolor: json['bgcolor'] as String? ?? '',
      bannercolor: json['bannercolor'] as String? ?? '',
      minpic: json['minpic'] as String? ?? '',
      middlepic: json['middlepic'] as String? ?? '',
      bigpic: json['bigpic'] as String? ?? '',
      createtime: json['createtime'],
      minarpic: json['minarpic'] as String? ?? '',
      bigarpic: json['bigarpic'] as String? ?? '',
      type: json['type'] as String? ?? '',
      typedesc: json['typedesc'],
      version: json['version'] as String? ?? '',
      deltime: json['deltime'] as String? ?? '',
      studentbgpic: json['studentbgpic'] as String? ?? '',
      studentminpic: json['studentminpic'] as String? ?? '',
      teacherbgpic: json['teacherbgpic'] as String? ?? '',
      teacherminpic: json['teacherminpic'] as String? ?? '',
    );

Map<String, dynamic> _$ThemeToJson(Theme instance) => <String, dynamic>{
      'id': instance.id,
      'bgcolor': instance.bgcolor,
      'bannercolor': instance.bannercolor,
      'minpic': instance.minpic,
      'middlepic': instance.middlepic,
      'bigpic': instance.bigpic,
      'createtime': instance.createtime,
      'minarpic': instance.minarpic,
      'bigarpic': instance.bigarpic,
      'type': instance.type,
      'typedesc': instance.typedesc,
      'version': instance.version,
      'deltime': instance.deltime,
      'studentbgpic': instance.studentbgpic,
      'studentminpic': instance.studentminpic,
      'teacherbgpic': instance.teacherbgpic,
      'teacherminpic': instance.teacherminpic,
    };

EnrollData _$EnrollDataFromJson(Map<String, dynamic> json) => EnrollData(
      enrollstate: json['enrollstate'] as String? ?? '',
      waitAuditCount: (json['waitAuditCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$EnrollDataToJson(EnrollData instance) =>
    <String, dynamic>{
      'enrollstate': instance.enrollstate,
      'waitAuditCount': instance.waitAuditCount,
    };

CourseInfo _$CourseInfoFromJson(Map<String, dynamic> json) => CourseInfo(
      coursename: json['coursename'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      createtime: json['createtime'] as String? ?? '',
      code: json['code'] as String? ?? '',
      cipher: json['cipher'] as String? ?? '',
      classname: json['classname'] as String? ?? '',
      stopcode: json['stopcode'] as String? ?? '',
      studytime: json['studytime'] as String? ?? '',
      teachtype: json['teachtype'] as String? ?? '',
      recommendresource: json['recommendresource'] as String? ?? '',
      forbiddiscuss: json['forbiddiscuss'] as String? ?? '',
      resourceId: json['resource_id'] as String? ?? '',
      classending: json['classending'] as String? ?? '',
      canvisit: json['canvisit'] as String? ?? '',
      teacher: json['teacher'] == null
          ? Teacher.emptyInstance()
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      administrator: (json['administrator'] as num?)?.toInt() ?? 0,
      studentCount: (json['studentCount'] as num?)?.toInt() ?? 0,
      theme: json['theme'] == null
          ? Theme.emptyInstance()
          : Theme.fromJson(json['theme'] as Map<String, dynamic>),
      groupCount: json['groupCount'] is int
          ? json['groupCount'].toString()
          : (json['groupCount'] as String? ?? ''),
      types: json['types'] as String? ?? '',
      coid: (json['coid'] as num?)?.toInt() ?? 0,
      isattest: json['isattest'] as bool? ?? false,
      showRecommendChapter:
          (json['showRecommendChapter'] as num?)?.toInt() ?? 0,
      enrollData: json['enrollData'] == null
          ? EnrollData.emptyInstance()
          : EnrollData.fromJson(json['enrollData'] as Map<String, dynamic>),
      identity: (json['identity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CourseInfoToJson(CourseInfo instance) =>
    <String, dynamic>{
      'coursename': instance.coursename,
      'uid': instance.uid,
      'createtime': instance.createtime,
      'code': instance.code,
      'cipher': instance.cipher,
      'classname': instance.classname,
      'stopcode': instance.stopcode,
      'studytime': instance.studytime,
      'teachtype': instance.teachtype,
      'recommendresource': instance.recommendresource,
      'forbiddiscuss': instance.forbiddiscuss,
      'resource_id': instance.resourceId,
      'classending': instance.classending,
      'canvisit': instance.canvisit,
      'teacher': instance.teacher.toJson(),
      'administrator': instance.administrator,
      'studentCount': instance.studentCount,
      'theme': instance.theme.toJson(),
      'groupCount': instance.groupCount,
      'types': instance.types,
      'coid': instance.coid,
      'isattest': instance.isattest,
      'showRecommendChapter': instance.showRecommendChapter,
      'enrollData': instance.enrollData.toJson(),
      'identity': instance.identity,
    };
