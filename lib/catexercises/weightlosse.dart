import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';
import 'package:get/get.dart';

class WeightlosseController extends GetxController {
  var selectedCategory = 0.obs;

  void setSelectedCategory(int day) {
    selectedCategory.value = day;
  }
}

class Weightlosse extends StatelessWidget {
  Weightlosse({super.key});

  final WeightlosseController controller = Get.put(WeightlosseController());

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
                CatExercises(
                    selectedValue: controller.selectedCategory,
                    onChanged: (value) { controller.setSelectedCategory(value);}),
                const CustomTextFormField(labelText: 'The name of exercise'),
                const CustomTextFormField(labelText: 'Time of play'),
                const CustomTextFormField(labelText: 'explination'),
                SizedBox(width: 225, child: Addtips(buttonText: 'add video')),
                SizedBox(width: 225, child: Addtips(buttonText: 'submit'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
