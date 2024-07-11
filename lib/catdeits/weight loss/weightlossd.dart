// ignore_for_file: avoid_print, file_names

import 'package:adminfitness/catdeits/weight%20loss/weightlossdController.dart';
import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';
import 'package:get/get.dart';

class WeightlossdController extends GetxController {
  var selectedDay = 0.obs;

  void setSelectedDay(int day) {
    selectedDay.value = day;
  }
}

class Weightlossd extends StatelessWidget {
  Weightlossd({super.key});

  final WeightlossdController controller = Get.put(WeightlossdController());
  final DietsController dietsController = Get.put(DietsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: 'assets/images/homepage.jpeg'),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: BlurContainer(
                height: 600,
                width: 600,
                padding: 25,
                list: [
                  MyText(text: 'Diets', fontsize: 40),
                  CatExercises(
                      selectedValue: controller.selectedDay,
                      onChanged: (value) {
                        controller.setSelectedDay(value);
                        dietsController.dayId = value;
                        print(dietsController.dayId);
                      }),
                  CustomTextFormField(
                    labelText: 'The date of diet',
                    onChanged: (value) {
                      dietsController.time.value = value;
                      print(dietsController.time.value);
                    },
                  ),
                  CustomTextFormField(
                    labelText: 'Description of diet',
                    onChanged: (value) {
                      dietsController.description.value = value;
                      print(dietsController.description.value);
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
                        dietsController.pickImage();
                      },
                    ),
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
                      onPressed: dietsController.addDiet,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 161, 153, 153),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
