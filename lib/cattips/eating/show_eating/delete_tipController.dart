// ignore_for_file: avoid_print

import 'package:adminfitness/serveices/deletetip_service.dart';
import 'package:get/get.dart';

class DeleteTipController extends GetxController {
  var isDeleting = false.obs;
  var errorMessage = ''.obs;
  var loadingTips = <int, bool>{}.obs;

  final DeleteTipService _deleteTipService = DeleteTipService();

  Future<void> deleteTip(int id) async {
    try {
      loadingTips[id] = true;
      isDeleting(true);
      errorMessage('');
      await _deleteTipService.deleteTip(id);
      Get.snackbar('Success', 'Tip deleted successfully');
      print('Tip deleted successfully');
    } catch (error) {
      errorMessage('Failed to delete tip');
      print('Error deleting tip: $error');
    } finally {
      loadingTips[id] = false;
      isDeleting(false);
    }
  }
}
