// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';

class AddDeitsService {
  Future<bool> deits(DeitsModel deitsModel) async {
    try {
      var response = await DioHelper.add_deits(
        time: deitsModel.time,
        day_id: deitsModel.day_id,
        description: deitsModel.description,
        image: deitsModel.image,
      );
      print('IN SERVICE_______________');
      print(deitsModel.time);
      print(deitsModel.day_id);
      print(deitsModel.description);
      print(response.statusCode);
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        return true;
      } else {
        print('Error response: ${response.data}');
        return false;
      }
    } catch (error) {
      print('Service error: $error');
      return false;
    }
  }
}
