import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

extension AsyncWhereExtension<T> on Iterable<T> {
  Future<List<T>> whereAsync(FutureOr<bool> Function(T element) test) async {
    List<T> result = [];
    for (var element in this) {
      final bool shouldInclude = await Future.value(test(element));
      if (shouldInclude) {
        result.add(element);
      }
    }
    return result;
  }
}

String mapperSignWay(int num) {
  switch (num) {
    case 1:
      return "数字签到";
    case 2:
      return "GPS签到";
    case 3:
      return "扫码签到";
    default:
      return "异常";
  }
}

String mapperSignStatus(int num) {
  switch (num) {
    case 1:
      return '旷课';
    case 3:
      return '请假';
    case 2:
      return '迟到';
    case 7:
      return '早退';
    case 0:
      return '出勤';
    case 100:
      return '正在签到';
      default:
        return '未知';
  }
}

void debugModePrint(String content) {
  if (kDebugMode) {
    print(content);
  }
}

extension TimestampFormatter on int {
  /// 返回格式化为日期字符串 (yyyy-MM-dd)
  String get day {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// 返回格式化为日期加时间字符串 (yyyy-MM-dd HH:mm:ss)
  String get time {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }
}