// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalUsers _$LocalUsersFromJson(Map<String, dynamic> json) => LocalUsers(
      userNumbers: (json['userNumbers'] as num?)?.toInt() ?? 0,
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LocalUsersToJson(LocalUsers instance) =>
    <String, dynamic>{
      'userNumbers': instance.userNumbers,
      'users': instance.users.map((e) => e.toJson()).toList(),
    };

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      name: json['name'] as String? ?? '',
      account: json['account'] as String? ?? '',
      password: json['password'] as String? ?? '',
      signStatus: json['signStatus'] as bool? ?? false,
      isCourse: json['isCourse'] as String? ?? '',
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'name': instance.name,
      'account': instance.account,
      'password': instance.password,
      'signStatus': instance.signStatus,
      'isCourse': instance.isCourse,
      'token': instance.token,
    };
