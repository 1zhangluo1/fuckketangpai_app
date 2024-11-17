// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamExamListResponse _$ExamExamListResponseFromJson(
        Map<String, dynamic> json) =>
    ExamExamListResponse(
      status: (json['status'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? Data.emptyInstance()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamExamListResponseToJson(
        ExamExamListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
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

ExamList _$ExamListFromJson(Map<String, dynamic> json) => ExamList(
      id: json['id'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      dirid: json['dirid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      attachment: json['attachment'],
      publishtype: json['publishtype'] as String? ?? '',
      limittype: json['limittype'] as String? ?? '',
      type: json['type'] as String? ?? '',
      fullscore: json['fullscore'] as String? ?? '',
      begintime: json['begintime'] as String? ?? '',
      endtime: json['endtime'] as String? ?? '',
      createtime: json['createtime'] as String? ?? '',
      timelength: json['timelength'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      fromid: json['fromid'],
      fromtype: json['fromtype'] as String? ?? '',
      fallback: json['fallback'] as String? ?? '',
      lastuid: json['lastuid'] as String? ?? '',
      viewanswer: json['viewanswer'] as String? ?? '',
      over: (json['over'] as num?)?.toInt() ?? 0,
      display: json['display'] as String? ?? '',
      solution: json['solution'],
      nohandupscore: json['nohandupscore'] as String? ?? '',
      weight: json['weight'] as String? ?? '',
      isrand: json['isrand'] as String? ?? '',
      randoption: json['randoption'] as String? ?? '',
      randextra: json['randextra'] as String? ?? '',
      comprehensionrand: json['comprehensionrand'] as String? ?? '',
      comprehensionrandoption: json['comprehensionrandoption'] as String? ?? '',
      mulscoretype: json['mulscoretype'] as String? ?? '',
      fillscoretype: json['fillscoretype'] as String? ?? '',
      casesensitive: json['casesensitive'] as String? ?? '',
      style: json['style'] as String? ?? '',
      viewtestpaper: json['viewtestpaper'] as String? ?? '',
      allowcopy: json['allowcopy'] as String? ?? '',
      allowpaster: json['allowpaster'] as String? ?? '',
      allowmultidevice: json['allowmultidevice'] as String? ?? '',
      cutscreen: json['cutscreen'] as String? ?? '',
      share: (json['share'] as num?)?.toInt() ?? 0,
      endmqsid: json['endmqsid'],
      beginmqsid: json['beginmqsid'] as String? ?? '',
      randtype: json['randtype'] as String? ?? '',
      issys: json['issys'] as String? ?? '',
      status: json['status'] as String? ?? '',
      deltime: json['deltime'] as String? ?? '',
      runing: (json['runing'] as num?)?.toInt() ?? 0,
      testpaperid: json['testpaperid'] as String? ?? '',
      contenttype: (json['contenttype'] as num?)?.toInt() ?? 0,
      rehandup: json['rehandup'] as String? ?? '',
      removeHtmlTagDescription:
          json['removeHtmlTagDescription'] as String? ?? '',
      removeHtmlTagDescriptionReservedImg:
          json['removeHtmlTagDescriptionReservedImg'] as String? ?? '',
      testpaperType: (json['testpaperType'] as num?)?.toInt() ?? 0,
      lessonlink: (json['lessonlink'] as List<dynamic>?)
              ?.map((e) => Lessonlink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      submitState: (json['submit_state'] as num?)?.toInt() ?? 0,
      index: json['index'] as String? ?? '',
      itemType: (json['item_type'] as num?)?.toInt() ?? 0,
      activitylabel: json['activitylabel'] as String? ?? '',
      copyright: json['copyright'] as String? ?? '',
      evaluateState: (json['evaluateState'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ExamListToJson(ExamList instance) => <String, dynamic>{
      'id': instance.id,
      'courseid': instance.courseid,
      'dirid': instance.dirid,
      'title': instance.title,
      'attachment': instance.attachment,
      'publishtype': instance.publishtype,
      'limittype': instance.limittype,
      'type': instance.type,
      'fullscore': instance.fullscore,
      'begintime': instance.begintime,
      'endtime': instance.endtime,
      'createtime': instance.createtime,
      'timelength': instance.timelength,
      'uid': instance.uid,
      'fromid': instance.fromid,
      'fromtype': instance.fromtype,
      'fallback': instance.fallback,
      'lastuid': instance.lastuid,
      'viewanswer': instance.viewanswer,
      'over': instance.over,
      'display': instance.display,
      'solution': instance.solution,
      'nohandupscore': instance.nohandupscore,
      'weight': instance.weight,
      'isrand': instance.isrand,
      'randoption': instance.randoption,
      'randextra': instance.randextra,
      'comprehensionrand': instance.comprehensionrand,
      'comprehensionrandoption': instance.comprehensionrandoption,
      'mulscoretype': instance.mulscoretype,
      'fillscoretype': instance.fillscoretype,
      'casesensitive': instance.casesensitive,
      'style': instance.style,
      'viewtestpaper': instance.viewtestpaper,
      'allowcopy': instance.allowcopy,
      'allowpaster': instance.allowpaster,
      'allowmultidevice': instance.allowmultidevice,
      'cutscreen': instance.cutscreen,
      'share': instance.share,
      'endmqsid': instance.endmqsid,
      'beginmqsid': instance.beginmqsid,
      'randtype': instance.randtype,
      'issys': instance.issys,
      'status': instance.status,
      'deltime': instance.deltime,
      'runing': instance.runing,
      'testpaperid': instance.testpaperid,
      'contenttype': instance.contenttype,
      'rehandup': instance.rehandup,
      'removeHtmlTagDescription': instance.removeHtmlTagDescription,
      'removeHtmlTagDescriptionReservedImg':
          instance.removeHtmlTagDescriptionReservedImg,
      'testpaperType': instance.testpaperType,
      'lessonlink': instance.lessonlink.map((e) => e.toJson()).toList(),
      'submit_state': instance.submitState,
      'index': instance.index,
      'item_type': instance.itemType,
      'activitylabel': instance.activitylabel,
      'copyright': instance.copyright,
      'evaluateState': instance.evaluateState,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
      pageTotal: (json['pageTotal'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => ExamList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      sort: json['sort'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'pageTotal': instance.pageTotal,
      'total': instance.total,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'sort': instance.sort,
    };
