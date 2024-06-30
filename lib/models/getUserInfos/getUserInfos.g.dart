// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getUserInfos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfos _$GetUserInfosFromJson(Map<String, dynamic> json) => GetUserInfos(
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserInfosToJson(GetUserInfos instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

AdditionInfo _$AdditionInfoFromJson(Map<String, dynamic> json) => AdditionInfo(
      enrolltime: json['enrolltime'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      classno: json['classno'] as String? ?? '',
    );

Map<String, dynamic> _$AdditionInfoToJson(AdditionInfo instance) =>
    <String, dynamic>{
      'enrolltime': instance.enrolltime,
      'grade': instance.grade,
      'classno': instance.classno,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      uid: json['uid'] as String? ?? '',
      username: json['username'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      department: json['department'],
      usertype: json['usertype'] as String? ?? '',
      email: json['email'],
      stno: json['stno'] as String? ?? '',
      school: json['school'] as String? ?? '',
      account: json['account'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      teachcourseid: json['teachcourseid'] as String? ?? '',
      attestInfo: json['attestInfo'] as List<dynamic>? ?? [],
      openid: json['openid'] as String? ?? '',
      unionid: json['unionid'] as String? ?? '',
      teachcourse: json['teachcourse'] as List<dynamic>? ?? [],
      additionInfo: json['additionInfo'] == null
          ? AdditionInfo.emptyInstance()
          : AdditionInfo.fromJson(json['additionInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'avatar': instance.avatar,
      'department': instance.department,
      'usertype': instance.usertype,
      'email': instance.email,
      'stno': instance.stno,
      'school': instance.school,
      'account': instance.account,
      'mobile': instance.mobile,
      'teachcourseid': instance.teachcourseid,
      'attestInfo': instance.attestInfo,
      'openid': instance.openid,
      'unionid': instance.unionid,
      'teachcourse': instance.teachcourse,
      'additionInfo': instance.additionInfo.toJson(),
    };
