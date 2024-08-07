// ignore_for_file: avoid_print, file_names

import 'package:adminfitness/catdeits/weight%20loss/addDietsController.dart';
import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';
import 'package:get/get.dart';

class DayController extends GetxController {
  var selectedDay = 0.obs;

  void setSelectedDay(int day) {
    selectedDay.value = day;
  }
}

class Weightlossd extends StatelessWidget {
  Weightlossd({super.key});

  final DayController controller = Get.put(DayController());
  final AddDietsController addDietsController = Get.put(AddDietsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: 'assets/images/homepage.jpeg'),
          Center(
            child: BlurContainer(
              height: 600,
              width: 600,
              padding: 25,
              list: [
                MyText(text: 'Weight Loss Diets', fontsize: 40),
                CatExercises(
                    selectedValue: controller.selectedDay,
                    onChanged: (value) {
                      controller.setSelectedDay(value);
                      addDietsController.dayId = value;
                      print(addDietsController.dayId);
                    }),
                CustomTextFormField(
                  labelText: 'The date of diet',
                  onChanged: (value) {
                    addDietsController.time.value = value;
                    print(addDietsController.time.value);
                  },
                ),
                CustomTextFormField(
                  labelText: 'Description of diet',
                  onChanged: (value) {
                    addDietsController.description.value = value;
                    print(addDietsController.description.value);
                  },
                ),
                SizedBox(
                  width: 225,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(15),
                    minWidth: 400,
                    color: const Color.fromARGB(255, 49, 0, 71),
                    child: const Text(
                      'Add Image',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 161, 153, 153),
                      ),
                    ),
                    onPressed: () async {
                      addDietsController.pickImage();
                    },
                  ),
                ),
                Obx(() {
                  return addDietsController.isLoading.value
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: 225,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(15),
                            minWidth: 400,
                            color: const Color.fromARGB(255, 49, 0, 71),
                            onPressed: addDietsController.addDiet,
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 161, 153, 153),
                              ),
                            ),
                          ),
                        );
                }),
                SizedBox(
                    width: 225,
                    child: Addtips(
                      buttonText: 'show diets',
                      routName: '/showweightlossd',
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
