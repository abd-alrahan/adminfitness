import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';
import 'package:dio/dio.dart';

class ShowDietsService {
  static Future<List<DeitsModel>> getDietsByDayId(int dayId) async {
    try {
      print('IN SERVICE__________');
      Response response = await DioHelper.show_deits(dayId: dayId);
      print('after diohelper');
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('in service condition');
        List<dynamic> data = response.data['data'];
        print('stored in list successfully');
        return data.map((item) => DeitsModel.fromJson(item)).toList();
      } else {
        throw Exception('The "diets" key is missing or not a list');
      }
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      } else {
        print('Error fetching diets: $e');
      }
      rethrow;
    }
  }
}
