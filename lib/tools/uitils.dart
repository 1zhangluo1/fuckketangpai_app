import 'dart:async';

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