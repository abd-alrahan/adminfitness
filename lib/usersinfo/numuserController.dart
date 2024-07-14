// ignore_for_file: file_names

import 'package:adminfitness/serveices/numuser_service.dart';
import 'package:get/get.dart';


class NumuserController extends GetxController {
  var userCount = 0.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserCount();
  }

  void fetchUserCount() async {
    try {
      isLoading(true);
      int count = await NumuserService.fetchUserCount();
      userCount(count);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
