import 'package:fuckketangpai/Internet/network.dart';
import '../models/attence/attence.dart';

class GetCourseStatus {

  final dio = AppNetwork.get().ketangpaiDio;

  Future<Attence> getAttences({int size = 10,required int page,required String courseId}) async {
    final requestBody = {
      'courseid': courseId,
      'page': page,
      'size': size,
    };
    final response = await dio.post('/SummaryApi/attence',data: requestBody);
    final temp = response.data['data'];
    final attence = Attence.fromJson(temp);
    return attence;
  }

  GetCourseStatus._create();

  static GetCourseStatus? _instance;

  factory GetCourseStatus.get() => GetCourseStatus._instance ??= GetCourseStatus._create();

}