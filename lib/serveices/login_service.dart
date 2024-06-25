// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> login(LogInModel loginModel) async {
    // try {
    //   final response = await http.post(
    //     Uri.parse('http://localhost:8000/api/admin/login'),
    //     // headers: {'Content-Type': 'application/json'},
    //     body: json.encode(loginModel.toJson()),
    //   ); // Add a timeout

    //   if (response.statusCode == 200) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } catch (e) {
    //   print('Error: $e');
    //   return false;
    // }

    // if (loginModel.email == '') loginModel.email = 'admin@gmail.com';
    // if (loginModel.password == '') loginModel.password = 'admin12345';
    var response = await DioHelper.login(
        email: loginModel.email, password: loginModel.password);
    // var response = await DioHelper.login(
    //     email: loginModel.email == '' ? 'admin@gmail.com' : loginModel.email, password: loginModel.password == '' ? 'admin12345' : loginModel.password);
    print(response.data);
    return response.data['name'] != null;
  }
}
