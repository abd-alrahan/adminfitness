import 'package:adminfitness/components/components.dart';
import 'package:adminfitness/usersinfo/numuserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final NumuserController numuserController = Get.put(NumuserController());

    return Scaffold(
      body: Stack(
        children: [
          // Background image with opacity
          BackgroundImage(
            image: 'assets/images/homepage.jpeg',
          ),
          // Centered Lottie animations
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottiPreviewer(),
                    SizedBox(height: 60), // Adjust spacing between Lottie animations
                    LottiPreviewer(),
                  ],
                ),
                SizedBox(width: 60), // Adjust spacing between columns
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottiPreviewer(),
                    SizedBox(height: 60), // Adjust spacing between Lottie animations
                    LottiPreviewer(),
                  ],
                ),
              ],
            ),
          ),
          // Blurring effect at specific position
          Positioned(
            top: 0, // Adjust the position as needed
            left: 0, // Adjust the position as needed
            child: BlurContainer(
              height: 641,
              width: 350,
              list: [
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Addtips(
                    buttonText: 'Add exercises',
                    list: [
                      Addtips(
                        buttonText: 'Weight Loss Exercise',
                        routName: '/weightlosse',
                      ),
                      Addtips(
                        buttonText: 'Muscly Building Exercise',
                        routName: '/musclybuilde',
                      ),
                      Addtips(
                        buttonText: 'Flexibility Exercise',
                        routName: '/flexibilitye',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Addtips(
                    buttonText: 'Add deits',
                    list: [
                      Addtips(
                        buttonText: 'Weight Loss Deit',
                        routName: '/weightlossd',
                      ),
                      Addtips(
                        buttonText: 'Muscly Building Deit',
                        routName: '/musclybuildd',
                      ),
                      Addtips(
                        buttonText: 'Flexibility Deit',
                        routName: '/flexibilityd',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Addtips(
                    buttonText: 'Add tips',
                    list: [
                      Addtips(buttonText: 'Eating', routName: '/eating'),
                      Addtips(buttonText: 'Sleep', routName: '/sleep'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0, // Adjust the position as needed
            right: 0, // Adjust the position as needed
            child: BlurContainer(
              height: 641,
              width: 350,
              list: [
                SizedBox(
                  width: 175,
                  height: 175,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset('assets/images/adminpic2.jpg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: MyText(
                    text:
                        'Manage your sports world with ease and efficiency. Welcome to the control center for all things sports!',
                    fontsize: 20,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: MyText(
                        text: 'Number of users:',
                        fontsize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() {
                      if (numuserController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (numuserController.errorMessage.isNotEmpty) {
                        return Center(child: Text(numuserController.errorMessage.value));
                      } else {
                        return SizedBox(
                          width: 325,
                          child: Addtips(
                            buttonText: '${numuserController.userCount.value} USERS',
                            routName: '/usersinfo',
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
