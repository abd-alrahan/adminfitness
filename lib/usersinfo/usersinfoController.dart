// ignore_for_file: avoid_print, file_names

import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/userdetal_service.dart';
import 'package:get/get.dart';

class UserinfoController extends GetxController {
  var isLoading = true.obs;
  var users = <UserModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllUsers();
  }

  void fetchAllUsers() async {
    try {
      //  print('IN CONTROLLER ______________________');
      isLoading(true);
      for (int i = 1; i <= 50; i++) {
        var fetchedUsers = await UserdetalService.fetchUsers(i);
        if (fetchedUsers.isNotEmpty) {
          users.addAll(fetchedUsers);
        }
      }
      // print(users.length);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
