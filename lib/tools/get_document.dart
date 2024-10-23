import 'package:path_provider/path_provider.dart';

Future<String> get docPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}