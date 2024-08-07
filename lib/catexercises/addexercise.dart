import 'package:adminfitness/catdeits/weight%20loss/weightlossd.dart';
import 'package:adminfitness/catexercises/addexerciseController.dart';
import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';
import 'package:get/get.dart';

class CatController extends GetxController {
  var selectedCat = 0.obs;

  void setSelectedCat(int categoryId) {
    selectedCat.value = categoryId;
  }
}

class AddExercise extends StatelessWidget {
  AddExercise({super.key});

  final DayController dayController = Get.put(DayController());
  final CatController catController = Get.put(CatController());
  final AddExerciseController addExerciseController =
      Get.put(AddExerciseController());

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
                MyText(text: 'Exercises', fontsize: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() {
                      return DropdownButton<int>(
                        value: dayController.selectedDay.value == 0
                            ? null
                            : dayController.selectedDay.value,
                        hint: const Text('Select a Day'),
                        items: List.generate(15, (index) => index + 1)
                            .map((day) => DropdownMenuItem(
                                  value: day,
                                  child: Text('Day $day'),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            dayController.setSelectedDay(value);
                            addExerciseController.dayId.value = value;
                            print(addExerciseController.dayId.value);
                          }
                        },
                      );
                    }),
                    Obx(() {
                      return DropdownButton<int>(
                        value: catController.selectedCat.value == 0
                            ? null
                            : catController.selectedCat.value,
                        hint: const Text('Select a Category'),
                        items: const [
                          DropdownMenuItem(
                              value: 1, child: Text('Weight Loss')),
                          DropdownMenuItem(
                              value: 2, child: Text('Muscle Building')),
                          DropdownMenuItem(
                              value: 3, child: Text('Flexibility')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            catController.setSelectedCat(value);
                            addExerciseController.categoryId.value = value;
                            print(addExerciseController.categoryId.value);
                          }
                        },
                      );
                    }),
                  ],
                ),
                CustomTextFormField(
                    labelText: 'The name of exercise',
                    onChanged: (value) {
                      addExerciseController.name.value = value;
                      print(addExerciseController.name.value);
                    }),
                CustomTextFormField(
                    labelText: 'Time of play',
                    onChanged: (value) {
                      addExerciseController.time.value =
                          int.tryParse(value) ?? 0;
                      print(addExerciseController.time.value);
                    }),
                CustomTextFormField(
                    labelText: 'Explanation',
                    onChanged: (value) {
                      addExerciseController.description.value = value;
                      print(addExerciseController.description.value);
                    }),
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
                      'Add Video',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 161, 153, 153),
                      ),
                    ),
                    onPressed: () async {
                      await addExerciseController.pickJson();
                      print('pick json success');
                    },
                  ),
                ),
                Obx(() {
                  return addExerciseController.isLoading.value
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
                            onPressed: addExerciseController.addExercise,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
