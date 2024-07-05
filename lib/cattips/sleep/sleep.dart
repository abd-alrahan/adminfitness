import 'package:adminfitness/cattips/sleep/sleepController.dart';
import 'package:adminfitness/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sleep extends StatelessWidget {
  Sleep({super.key});

  final SleepController _sleepController = Get.put(SleepController());

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
                  MyText(text: 'sleep tips', fontsize: 40),
                  MyText(
                      text:
                          'make your tips comfortable, the best way to get healthy the perfect sleep tips!!',
                      fontsize: 20),
                   CustomTextFormField(
                      onChanged: (text) {
                      _sleepController.description.value = text;
                    },
                      labelText: 'description of the tip'),
                  Obx(() {
                      return  _sleepController.isLoading.value
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
                                  onPressed: _sleepController.addTip,
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
          ),
        ],
      ),
    );
  }
}
