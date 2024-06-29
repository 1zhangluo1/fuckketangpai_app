import 'dart:math';

String generateRandomString() {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();
}