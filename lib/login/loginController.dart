// ignore_for_file: file_names

import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final _loginService = LoginService();

  void login() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      isLoading.value = true;
      LogInModel loginModel = LogInModel(email: email.value, password: password.value);
      bool success = await _loginService.login(loginModel);
      isLoading.value = false;
      if (success) {
        Get.toNamed('/home');
      } else {
        Get.snackbar('Error', 'Login failed. Please try again.');
      }
    } else {
      Get.snackbar('Error', 'Please enter email and password.');
    }
  }
}
