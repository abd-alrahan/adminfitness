import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';
import 'package:get/get.dart';

class MusclybuilddController extends GetxController {
  var selectedDay = 0.obs;

  void setSelectedDay(int day) {
    selectedDay.value = day;
  }
}

class Musclybuildd extends StatelessWidget {
  Musclybuildd({super.key});

  final MusclybuilddController controller = Get.put(MusclybuilddController());

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
                  MyText(text: 'Muscly building deits', fontsize: 25),
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
