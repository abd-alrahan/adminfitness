import 'package:adminfitness/cattips/eating/eatingController.dart';
import 'package:adminfitness/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Eating extends StatelessWidget {
  Eating({super.key});

  final EatingController _eatingController = Get.put(EatingController());

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
                  MyText(text: 'Eating Tips', fontsize: 40),
                  MyText(
                    text: 'Make your tips effective, the more healthy they are the better! Follow these eating tips!!',
                    fontsize: 20,
                  ),
                  CustomTextFormField(
                    onChanged: (text) {
                      _eatingController.description.value = text;
                    },
                    labelText: 'Description of the tip',
                  ),
                     Obx(() {
                      return  _eatingController.isLoading.value
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
                                  onPressed: _eatingController.addTip,
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
