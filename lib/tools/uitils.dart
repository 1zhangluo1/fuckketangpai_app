import 'dart:async';

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