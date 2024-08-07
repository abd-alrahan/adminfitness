// ignore_for_file: avoid_print, file_names

import 'package:adminfitness/serveices/deletedeits_service.dart';
import 'package:get/get.dart';

class DeleteDietsController extends GetxController {
  var isDeleting = false.obs;
  var errorMessage = ''.obs;
  var loadingTips = <int, bool>{}.obs;

  final DeleteDeitService deleteDeitService = DeleteDeitService();

  Future<void> deleteDiet(int dayId , int id) async {
    try {
      loadingTips[id] = true;
      isDeleting(true);
      errorMessage('');
      await deleteDeitService.deleteDiet(dayId , id);
      Get.snackbar('Success', 'Diet deleted successfully');
      print('Diet deleted successfully');
    } catch (error) {
      errorMessage('Failed to delete diet');
      print('Error deleting diet: $error');
    } finally {
      loadingTips[id] = false;
      isDeleting(false);
    }
  }
}
