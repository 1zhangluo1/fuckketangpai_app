// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamQuestion _$ExamQuestionFromJson(Map<String, dynamic> json) => ExamQuestion(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamQuestionToJson(ExamQuestion instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      id: json['id'] as String? ?? '',
      subjectid: json['subjectid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      status: json['status'] as String? ?? '',
      deltime: json['deltime'] as String? ?? '',
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'id': instance.id,
      'subjectid': instance.subjectid,
      'title': instance.title,
      'status': instance.status,
      'deltime': instance.deltime,
    };

Lists _$ListsFromJson(Map<String, dynamic> json) => Lists(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      score: json['score'] as String? ?? '',
      sort: json['sort'] as String? ?? '',
      attachment: json['attachment'],
      difficulty: json['difficulty'] as String? ?? '',
      replenishtype: json['replenishtype'] as String? ?? '',
      extract: json['extract'] as bool? ?? false,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      myanswer: json['myanswer'] as String?,
    );

Map<String, dynamic> _$ListsToJson(Lists instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'score': instance.score,
      'sort': instance.sort,
      'attachment': instance.attachment,
      'difficulty': instance.difficulty,
      'replenishtype': instance.replenishtype,
      'extract': instance.extract,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'myanswer': instance.myanswer,
    };

Cutscreen _$CutscreenFromJson(Map<String, dynamic> json) => Cutscreen(
      cutscreenState: (json['cutscreenState'] as num?)?.toInt() ?? 0,
      testpaperAllCount: (json['testpaperAllCount'] as num?)?.toInt() ?? 0,
      studentCount: (json['studentCount'] as num?)?.toInt() ?? 0,
      lastCount: (json['lastCount'] as num?)?.toInt() ?? 0,
      testCode: json['testCode'] as String? ?? '',
      isFirstJoin: (json['isFirstJoin'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CutscreenToJson(Cutscreen instance) => <String, dynamic>{
      'cutscreenState': instance.cutscreenState,
      'testpaperAllCount': instance.testpaperAllCount,
      'studentCount': instance.studentCount,
      'lastCount': instance.lastCount,
      'testCode': instance.testCode,
      'isFirstJoin': instance.isFirstJoin,
    };

Testpaper _$TestpaperFromJson(Map<String, dynamic> json) => Testpaper(
      begintime: json['begintime'] as String? ?? '',
      endtime: json['endtime'] as String? ?? '',
      timelength: (json['timelength'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      totalScore: (json['totalScore'] as num?)?.toInt() ?? 0,
      style: json['style'] as String? ?? '',
      allowcopy: json['allowcopy'] as String? ?? '',
      allowpaster: json['allowpaster'] as String? ?? '',
      fallback: json['fallback'] as String? ?? '',
      countDown: (json['countDown'] as num?)?.toInt() ?? 0,
      viewanswer: json['viewanswer'] as String? ?? '',
      cutscreen: json['cutscreen'] == null
          ? Cutscreen.emptyInstance()
          : Cutscreen.fromJson(json['cutscreen'] as Map<String, dynamic>),
      over: json['over'] as String? ?? '',
      isrand: json['isrand'] as String? ?? '',
      randextra: json['randextra'] as String? ?? '',
      randtype: json['randtype'] as String? ?? '',
    );

Map<String, dynamic> _$TestpaperToJson(Testpaper instance) => <String, dynamic>{
      'begintime': instance.begintime,
      'endtime': instance.endtime,
      'timelength': instance.timelength,
      'title': instance.title,
      'totalCount': instance.totalCount,
      'totalScore': instance.totalScore,
      'style': instance.style,
      'allowcopy': instance.allowcopy,
      'allowpaster': instance.allowpaster,
      'fallback': instance.fallback,
      'countDown': instance.countDown,
      'viewanswer': instance.viewanswer,
      'cutscreen': instance.cutscreen.toJson(),
      'over': instance.over,
      'isrand': instance.isrand,
      'randextra': instance.randextra,
      'randtype': instance.randtype,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      lists: (json['lists'] as List<dynamic>?)
              ?.map((e) => Lists.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      handupState: json['handupState'] as String? ?? '',
      rehandup: json['rehandup'] as String? ?? '',
      testpaper: json['testpaper'] == null
          ? Testpaper.emptyInstance()
          : Testpaper.fromJson(json['testpaper'] as Map<String, dynamic>),
      remainTimes: (json['remainTimes'] as num?)?.toInt() ?? 0,
      begintime: json['begintime'],
      fallbackNumber: (json['fallback_number'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'lists': instance.lists.map((e) => e.toJson()).toList(),
      'handupState': instance.handupState,
      'rehandup': instance.rehandup,
      'testpaper': instance.testpaper.toJson(),
      'remainTimes': instance.remainTimes,
      'begintime': instance.begintime,
      'fallback_number': instance.fallbackNumber,
    };
