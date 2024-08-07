// ignore_for_file: file_names, avoid_print, avoid_web_libraries_in_flutter, prefer_typing_uninitialized_variables

import 'dart:typed_data';
import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/adddeits_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class AddDietsController extends GetxController {
  var description = ''.obs;
  var time = ''.obs;
  var dayId = 0;
  late Uint8List fileBytes;
  var isLoading = false.obs;
  var imagePath ;

  final AddDeitsService _addDeitsService = AddDeitsService();

  Future<void> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.any);
      if (result != null && result.files.isNotEmpty) {
        fileBytes = result.files.first.bytes!;
        final fileName = result.files.first.name;
        print('File selected: $fileName');
      } else {
        print("No file selected or file is empty");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  void addDiet() async {
    if (description.value.isNotEmpty && time.value.isNotEmpty) {
      isLoading.value = true;
      print('In addDiet');
      DeitsModel deitsModel = DeitsModel(
        time: time.value,
        day_id: dayId,
        description: description.value,
        image: fileBytes, // Pass the Uint8List to the model
      );
      print('In addDiet2');
      bool success = await _addDeitsService.deits(deitsModel);
      isLoading.value = false;
      if (success) {
        Get.snackbar('Success', 'Diet added successfully');
        description.value = '';
        time.value = '';
        //imagePath.value = null;
      } else {
        Get.snackbar('Error', 'Failed to add diet');
      }
    } else {
      Get.snackbar('Error', 'Please fill all fields and select an image');
    }
  }
}
