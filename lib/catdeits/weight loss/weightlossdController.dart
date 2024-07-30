// ignore_for_file: file_names, avoid_print, avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/adddeits_service.dart';
import 'package:get/get.dart';

class DietsController extends GetxController {
  var description = ''.obs;
  var time = ''.obs;
  var dayId = 0;
  html.File? imagePath; // Use nullable type
  var isLoading = false.obs;

  final AddDeitsService _addDeitsService = AddDeitsService();

  Future<void> pickImage() async {
    try {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*'; // Restrict to images
      uploadInput.click();

      uploadInput.onChange.listen((e) {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          imagePath = files[0];
          print("File selected: ${files[0].name}");
        } else {
          print("No file selected or file is empty");
        }
      });
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  void addDiet() async {
    if (description.value.isNotEmpty && time.value.isNotEmpty && imagePath != null) {
      isLoading.value = true;

      DeitsModel deitsModel = DeitsModel(
        time: time.value,
        day_id: dayId,
        description: description.value,
        image: imagePath!, // Pass the html.File to the model
      );
      print('IN CONTROLLER____________________');
      bool success = await _addDeitsService.deits(deitsModel);
      isLoading.value = false;
      print(success);
      if (success) {
        Get.snackbar('Success', 'Diet added successfully');
        print(description.value);
        print(dayId);
      } else {
        Get.snackbar('Error', 'Failed to add diet');
      }
    } else {
      Get.snackbar('Error', 'Please fill all fields and select an image');
    }
  }
}
