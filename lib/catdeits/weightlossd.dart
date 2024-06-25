// ignore_for_file: avoid_print

import 'package:file_picker/file_picker.dart';
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
                  MyText(text: 'Deits', fontsize: 40),
                  CatExercises(
                      selectedValue: controller.selectedDay,
                      onChanged: (value) {
                        controller.setSelectedDay(value);
                      }),
                  const CustomTextFormField(labelText: 'The date of deit'),
                  const CustomTextFormField(labelText: 'description of deit'),
                  SizedBox(
                      width: 225,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(15),
                          minWidth: 400,
                          color: const Color.fromARGB(255, 49, 0, 71),
                          child: const Text('add image',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 161, 153, 153))),
                          onPressed: () async {
                            final result =
                                await FilePicker.platform.pickFiles();
                            if (result == null) return;
                            final file = result.files.first;
                            print(file.name);
                          })),
                  SizedBox(width: 225, child: Addtips(buttonText: 'submit'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
