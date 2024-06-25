import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';
import 'package:get/get.dart';

class FlexibilitydController extends GetxController {
  var selectedDay = 0.obs;

  void setSelectedDay(int day) {
    selectedDay.value = day;
  }
}

class Flexibilityd extends StatelessWidget {
  Flexibilityd({super.key});

  final FlexibilitydController controller = Get.put(FlexibilitydController());

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
                  MyText(text: 'flexibility deits', fontsize: 25),
                  // Days(
                  //     selectedValue: controller.selectedDay,
                  //     onChanged: (value) { controller.setSelectedDay(value);}),
                  const CustomTextFormField(labelText: 'The date of deit'),
                  const CustomTextFormField(labelText: 'description of deit'),
                  SizedBox(width: 225, child: Addtips(buttonText: 'add image')),
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
