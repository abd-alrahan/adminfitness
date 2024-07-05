// ignore_for_file: avoid_print

import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';

class AddtipsService {
  Future<bool> tips(TipsModel tipsModel) async {
    try {
      var response = await DioHelper.tips(
        description: tipsModel.description,
        category_id: tipsModel.category_id,
      );
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
