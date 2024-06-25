import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';

class AddtipsService {
  Future<bool> tips(TipsModel tipsModel) async {

    var response = await DioHelper.tips(
        description: tipsModel.description, category_id: tipsModel.category_id);
    
    print(response.data);
    return response.statusCode == 200;
  }
}