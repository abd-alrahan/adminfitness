import 'dart:typed_data';
import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/addexercise_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class AddExerciseController extends GetxController {
  final AddExerciseService addExerciseService = Get.put(AddExerciseService());

  var description = ''.obs;
  var time = 0.obs;
  var name = ''.obs;
  var categoryId = 0.obs;
  var dayId = 0.obs;
  late Uint8List fileBytes;
  var isLoading = false.obs;

  Future<void> pickJson() async {
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

  void addExercise() async {
    if (description.value.isNotEmpty && name.value.isNotEmpty && categoryId.value > 0 && dayId.value > 0) {
      isLoading.value = true;
      print('In addExercise');
      ExerciseModel exerciseModel = ExerciseModel(
        time: time.value,
        name: name.value,
        description: description.value,
        json: fileBytes, // Pass the Uint8List to the model
      );
      print('In addExercise2');
      bool success = await addExerciseService.addExerciseWithAssignments(
        exerciseModel: exerciseModel,
        categoryId: categoryId.value,
        dayId: dayId.value,
      );
      isLoading.value = false;
      if (success) {
        Get.snackbar('Success', 'Exercise added successfully');
        description.value = '';
        time.value = 0;
        name.value = '';
        categoryId.value = 0;
        dayId.value = 0;
        // imagePath.value = null;
      } else {
        Get.snackbar('Error', 'Failed to add exercise');
      }
    } else {
      Get.snackbar('Error', 'Please fill all fields and select a file');
    }
  }
}
