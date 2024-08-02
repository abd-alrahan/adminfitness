// ignore_for_file: file_names, avoid_print

import 'package:adminfitness/constants/constants.dart';
import 'package:adminfitness/serveices/showtips_service.dart';
import 'package:get/get.dart';
import 'package:adminfitness/models/models.dart';

class ShowEatingController extends GetxController {
  var tipsList = <TipsModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var categoryId = catMap['eating'];

  final ShowtipsService _showtipsService = ShowtipsService();

  Future<void> fetchTips(int categoryId) async {
    try {
      print('IN EATING CONTROLLER__________');
      isLoading(true);
      errorMessage('');
      var tips = await _showtipsService.fetchTips(categoryId);
      print('AFTER FETCH EATING CONTROLLER_________');
      tipsList.assignAll(tips);
    } catch (error) {
      errorMessage('Failed to load tips');
    } finally {
      isLoading(false);
    }
  }
}
