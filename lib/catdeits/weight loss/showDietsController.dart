import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/showdeits_service.dart';
import 'package:get/get.dart';

class ShowDietsController extends GetxController {
  var dietsList = <DeitsModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void fetchDietsByDayId(int dayId) async {
    try {
      print('IN CONTROLLER________');
      isLoading(true);
      errorMessage('');
      List<DeitsModel> diets = await ShowDietsService.getDietsByDayId(dayId);
      dietsList.assignAll(diets);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
