import 'package:adminfitness/api/dio_helper.dart';
import 'package:dio/dio.dart';

class DeleteuserService {
  static Future<Response> deleteUser(int id) async {
    try {
      return await DioHelper.deleteuser(id);
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
