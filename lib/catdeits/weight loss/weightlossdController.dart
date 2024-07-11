// ignore_for_file: file_names, avoid_print

import 'dart:typed_data';
import 'package:adminfitness/constants/constants.dart';
import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/adddeits_service.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class DietsController extends GetxController {
  var description = ''.obs;
  var time = ''.obs;
  var dayId = catDeit['Weight Loss'];
  var imagePath = Rxn<Uint8List>();
  var isLoading = false.obs;

  final AddDeitsService _addDeitsService = AddDeitsService();

  Future<void> pickImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null && result.files.single.bytes != null) {
        imagePath.value = result.files.single.bytes!;
        print("File selected: ${result.files.single.name}");
      } else {
        print("No file selected or file is empty");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  void addDiet() async {
    if (description.value.isNotEmpty &&
        time.value.isNotEmpty &&
        imagePath.value != null) {
      isLoading.value = true;

      DeitsModel deitsModel = DeitsModel(
        time: time.value,
        day_id: dayId,
        description: description.value,
        image: imagePath.value!, // Pass the Uint8List to the model
      );
       print('in secreen___________________________________');
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
