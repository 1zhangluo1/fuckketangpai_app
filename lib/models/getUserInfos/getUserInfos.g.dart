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

VipObject _$VipObjectFromJson(Map<String, dynamic> json) => VipObject(
      coid: (json['coid'] as num?)?.toInt() ?? 0,
      vip: (json['vip'] as num?)?.toInt() ?? 0,
      triplescreen: (json['triplescreen'] as num?)?.toInt() ?? 0,
      jigouVip: json['jigouVip'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$VipObjectToJson(VipObject instance) => <String, dynamic>{
      'coid': instance.coid,
      'vip': instance.vip,
      'triplescreen': instance.triplescreen,
      'jigouVip': instance.jigouVip,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      usertype: json['usertype'] as String? ?? '',
      username: json['username'] as String? ?? '',
      account: json['account'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      stno: json['stno'] as String? ?? '',
      school: json['school'] as String? ?? '',
      email: json['email'],
      mobile: json['mobile'] as String? ?? '',
      department: json['department'],
      teachcourseid: json['teachcourseid'] as String? ?? '',
      isenterprise: (json['isenterprise'] as num?)?.toInt() ?? 0,
      coid: (json['coid'] as num?)?.toInt() ?? 0,
      vipObject: json['vipObject'] == null
          ? VipObject.emptyInstance()
          : VipObject.fromJson(json['vipObject'] as Map<String, dynamic>),
      token: json['token'] as String? ?? '',
      oldtoken: json['oldtoken'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      isvip: (json['isvip'] as num?)?.toInt() ?? 0,
      setting: json['setting'] as String? ?? '',
      mobileUrl: json['mobile_url'] as String? ?? '',
      bindWechat: json['bindWechat'] as bool? ?? false,
      coidAdmin: (json['coidAdmin'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'usertype': instance.usertype,
      'username': instance.username,
      'account': instance.account,
      'avatar': instance.avatar,
      'stno': instance.stno,
      'school': instance.school,
      'email': instance.email,
      'mobile': instance.mobile,
      'department': instance.department,
      'teachcourseid': instance.teachcourseid,
      'isenterprise': instance.isenterprise,
      'coid': instance.coid,
      'vipObject': instance.vipObject.toJson(),
      'token': instance.token,
      'oldtoken': instance.oldtoken,
      'uid': instance.uid,
      'isvip': instance.isvip,
      'setting': instance.setting,
      'mobile_url': instance.mobileUrl,
      'bindWechat': instance.bindWechat,
      'coidAdmin': instance.coidAdmin,
    };
