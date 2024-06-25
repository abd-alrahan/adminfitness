import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';
import 'package:get/get.dart';

class FlexibilityeController extends GetxController {
  var selectedDay = 0.obs;

  void setSelectedDay(int day) {
    selectedDay.value = day;
  }
}

class Flexibilitye extends StatelessWidget {
  Flexibilitye({super.key});

  final FlexibilityeController controller = Get.put(FlexibilityeController());

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
                  MyText(text: 'flexibility Exercises', fontsize: 25),
                  // Days(
                  //      selectedCategory: null,
                  //     onChanged: (value) { controller.setSelectedDay(value);}),
                  const CustomTextFormField(labelText: 'The name of exercise'),
                  const CustomTextFormField(labelText: 'Time of play'),
                  const CustomTextFormField(labelText: 'explination'),
                  SizedBox(width: 225, child: Addtips(buttonText: 'add video')),
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
