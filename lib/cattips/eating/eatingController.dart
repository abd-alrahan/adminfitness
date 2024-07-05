// ignore_for_file: file_names, avoid_print

import 'package:adminfitness/constants/constants.dart';
import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/addtips_service.dart';
import 'package:get/get.dart';

class EatingController extends GetxController {
  var description = ''.obs;
  var categoryId = catMap['eating'];
  var isLoading = false.obs;

  final _addtipsService = AddtipsService();

  void addTip() async {
    if (description.value.isNotEmpty) {
      isLoading.value = true;
      TipsModel tipsModel = TipsModel(
        description: description.value,
        category_id: categoryId,
      );
      bool success = await _addtipsService.tips(tipsModel);
      isLoading.value = false;
      if (success) {
        Get.snackbar('Success', 'Tip added successfully');
        print(description.value);
        print(categoryId);
      } else {
        Get.snackbar('Error', 'Failed to add tip');
      }
    } else {
      Get.snackbar('Error', 'Please enter a description');
    }
  }
}
