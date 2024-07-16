// ignore_for_file: file_names

import 'package:adminfitness/serveices/deleteuser_service.dart';
import 'package:get/get.dart';

class DeleteuserController extends GetxController {
  var isLoading = false.obs;
  var loadingUsers = <int, bool>{}.obs;
  var errorMessage = ''.obs;

  Future<void> deleteUser(int id) async {
    try {
      loadingUsers[id] = true; 
      update();
      await DeleteuserService.deleteUser(id);
      Get.snackbar('Success', 'User deleted successfully');
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('Error', 'Failed to delete user');
    } finally {
      loadingUsers[id] = false;
      update();
    }
  }
}

