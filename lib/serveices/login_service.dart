// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';

class LoginService {
  Future<bool> login(LogInModel loginModel) async {
    var response = await DioHelper.login(
        email: loginModel.email, password: loginModel.password);
    print(response.data);
    return response.data['name'] != null;
  }
}
