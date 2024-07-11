// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';

class AddDeitsService {
  Future<bool> deits(DeitsModel deitsModel) async {
    try {
      var response = await DioHelper.deits(
        time: deitsModel.time,
        day_id: deitsModel.day_id,
        description: deitsModel.description,
        image: deitsModel.image,
      );
      print('nooo_______________________________');
      print(deitsModel.time);
      print(deitsModel.day_id);
      print(deitsModel.description);
      //print(deitsModel.image);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }
}
