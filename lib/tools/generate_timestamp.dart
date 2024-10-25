extension DateTimeExtension on DateTime {
  int toSecondsTimestamp() {
    return millisecondsSinceEpoch ~/ 1000;
  }

  int toMillisecondsTimestamp() {
    return millisecondsSinceEpoch;
  }
}
