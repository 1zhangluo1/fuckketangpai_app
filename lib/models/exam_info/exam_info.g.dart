// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamInfo _$ExamInfoFromJson(Map<String, dynamic> json) => ExamInfo(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamInfoToJson(ExamInfo instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Cutscreen _$CutscreenFromJson(Map<String, dynamic> json) => Cutscreen(
      cutscreenState: (json['cutscreenState'] as num?)?.toInt() ?? 0,
      testpaperAllCount: (json['testpaperAllCount'] as num?)?.toInt() ?? 0,
      studentCount: (json['studentCount'] as num?)?.toInt() ?? 0,
      lastCount: (json['lastCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CutscreenToJson(Cutscreen instance) => <String, dynamic>{
      'cutscreenState': instance.cutscreenState,
      'testpaperAllCount': instance.testpaperAllCount,
      'studentCount': instance.studentCount,
      'lastCount': instance.lastCount,
    };

Lessonlink _$LessonlinkFromJson(Map<String, dynamic> json) => Lessonlink(
      type: (json['type'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$LessonlinkToJson(Lessonlink instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };

Testpaper _$TestpaperFromJson(Map<String, dynamic> json) => Testpaper(
      id: json['id'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      createtime: json['createtime'] as String? ?? '',
      over: json['over'].toString() as String? ?? '',
      viewanswer: json['viewanswer'] as String? ?? '',
      cutscreen: json['cutscreen'] == null
          ? Cutscreen.emptyInstance()
          : Cutscreen.fromJson(json['cutscreen'] as Map<String, dynamic>),
      display: json['display'] as String? ?? '',
      viewtestpaper: json['viewtestpaper'] as String? ?? '',
      begintime: json['begintime'] as String? ?? '',
      endtime: json['endtime'] as String? ?? '',
      timelength: (num.tryParse(json['timelength'].toString()) ?? 0).toInt(),
      attachment: json['attachment'],
      description: json['description'] as String? ?? '',
      type: json['type'] as String? ?? '',
      publishtype: json['publishtype'] as String? ?? '',
      handupState: json['handupState'] as String? ?? '',
      rehandup: json['rehandup'] as String? ?? '',
      testpaperType: (json['testpaperType'] as num?)?.toInt() ?? 0,
      lessonlink: (json['lessonlink'] as List<dynamic>?)
              ?.map((e) => Lessonlink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalScore: json['totalScore'] as String? ?? '',
      subjectCount: (json['subjectCount'] as num?)?.toInt() ?? 0,
      consumption: json['consumption'] as String? ?? '',
      submitStatus: (json['submit_status'] as num?)?.toInt() ?? 0,
      score: json['score'] as String? ?? '',
      submitState: (json['submit_state'] as num?)?.toInt() ?? 0,
      totalScore2: json['total_score'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      activitylabel: json['activitylabel'] as String? ?? '',
      copyright: json['copyright'] as String? ?? '',
    );

Map<String, dynamic> _$TestpaperToJson(Testpaper instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'courseid': instance.courseid,
      'title': instance.title,
      'createtime': instance.createtime,
      'over': instance.over,
      'viewanswer': instance.viewanswer,
      'cutscreen': instance.cutscreen.toJson(),
      'display': instance.display,
      'viewtestpaper': instance.viewtestpaper,
      'begintime': instance.begintime,
      'endtime': instance.endtime,
      'timelength': instance.timelength,
      'attachment': instance.attachment,
      'description': instance.description,
      'type': instance.type,
      'publishtype': instance.publishtype,
      'handupState': instance.handupState,
      'rehandup': instance.rehandup,
      'testpaperType': instance.testpaperType,
      'lessonlink': instance.lessonlink.map((e) => e.toJson()).toList(),
      'totalScore': instance.totalScore,
      'subjectCount': instance.subjectCount,
      'consumption': instance.consumption,
      'submit_status': instance.submitStatus,
      'score': instance.score,
      'submit_state': instance.submitState,
      'total_score': instance.totalScore2,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'activitylabel': instance.activitylabel,
      'copyright': instance.copyright,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      testpaper: json['testpaper'] == null
          ? Testpaper.emptyInstance()
          : Testpaper.fromJson(json['testpaper'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'testpaper': instance.testpaper.toJson(),
    };
