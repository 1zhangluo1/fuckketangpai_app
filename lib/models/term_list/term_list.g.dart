// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermList _$TermListFromJson(Map<String, dynamic> json) => TermList(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TermListToJson(TermList instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Topcourses _$TopcoursesFromJson(Map<String, dynamic> json) => Topcourses(
      id: json['id'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      issys: json['issys'] as String? ?? '',
      coursename: json['coursename'] as String? ?? '',
      code: json['code'] as String? ?? '',
      stopcode: (json['stopcode'] as num?)?.toInt() ?? 0,
      classname: json['classname'] as String? ?? '',
      semester: json['semester'] as String? ?? '',
      term: json['term'] as String? ?? '',
      isrecruit: json['isrecruit'] as String? ?? '',
      teachtype: json['teachtype'] as String? ?? '',
      studytime: json['studytime'] as String? ?? '',
      classending: json['classending'] as String? ?? '',
      canvisit: json['canvisit'] as String? ?? '',
      username: json['username'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      minpic: json['minpic'] as String? ?? '',
      middlepic: json['middlepic'] as String? ?? '',
      studentbgpic: json['studentbgpic'] as String? ?? '',
      studentminpic: json['studentminpic'] as String? ?? '',
      teacherbgpic: json['teacherbgpic'] as String? ?? '',
      teacherminpic: json['teacherminpic'] as String? ?? '',
      total: json['total'] as String? ?? '',
      role: (json['role'] as num?)?.toInt() ?? 0,
      neednatureclass: json['neednatureclass'] as String? ?? '',
      needgrade: json['needgrade'] as String? ?? '',
      needentrance: json['needentrance'] as String? ?? '',
      identity: json['identity'] as String? ?? '',
      isattest: json['isattest'] as bool? ?? false,
      isTop: (json['isTop'] as num?)?.toInt() ?? 0,
      icontype: (json['icontype'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TopcoursesToJson(Topcourses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'issys': instance.issys,
      'coursename': instance.coursename,
      'code': instance.code,
      'stopcode': instance.stopcode,
      'classname': instance.classname,
      'semester': instance.semester,
      'term': instance.term,
      'isrecruit': instance.isrecruit,
      'teachtype': instance.teachtype,
      'studytime': instance.studytime,
      'classending': instance.classending,
      'canvisit': instance.canvisit,
      'username': instance.username,
      'avatar': instance.avatar,
      'minpic': instance.minpic,
      'middlepic': instance.middlepic,
      'studentbgpic': instance.studentbgpic,
      'studentminpic': instance.studentminpic,
      'teacherbgpic': instance.teacherbgpic,
      'teacherminpic': instance.teacherminpic,
      'total': instance.total,
      'role': instance.role,
      'neednatureclass': instance.neednatureclass,
      'needgrade': instance.needgrade,
      'needentrance': instance.needentrance,
      'identity': instance.identity,
      'isattest': instance.isattest,
      'isTop': instance.isTop,
      'icontype': instance.icontype,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      semester: json['semester'] as String? ?? '',
      term: json['term'] as String? ?? '',
      termTxt: json['termTxt'] as String? ?? '',
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'semester': instance.semester,
      'term': instance.term,
      'termTxt': instance.termTxt,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      topcourses: (json['topcourses'] as List<dynamic>?)
              ?.map((e) => Topcourses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      semester: (json['semester'] as List<dynamic>?)
              ?.map((e) => Semester.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      number: (json['number'] as num?)?.toInt() ?? 0,
      isPopApprove: (json['isPopApprove'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'topcourses': instance.topcourses.map((e) => e.toJson()).toList(),
      'semester': instance.semester.map((e) => e.toJson()).toList(),
      'number': instance.number,
      'isPopApprove': instance.isPopApprove,
    };
