// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:adminfitness/catdeits/weightlossd.dart';
import 'package:adminfitness/catexercises/weightlosse.dart';
import 'package:adminfitness/cattips/eating/eating.dart';
import 'package:adminfitness/cattips/sleep/sleep.dart';
import 'package:adminfitness/components/components.dart';
import 'package:adminfitness/usersinfo/usersinfo.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                      height: 60), // Adjust spacing between Lottie animations
                  LottiPreviewer(),
                ],
              ),
              SizedBox(width: 60), // Adjust spacing between columns
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottiPreviewer(),
                  SizedBox(
                      height: 60), // Adjust spacing between Lottie animations
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
                        child: Addtips(buttonText: 'Add exercises',isTips: true, routName2: Weightlosse())
                      ),
                      SizedBox(
                        height: 100,
                        width: 250,
                        child: Addtips(
                          buttonText: 'Add deits', isTips: true, routName2: Weightlossd()),
                      ),
                      SizedBox(
                        height: 100,
                        width: 250,
                        child: Addtips(
                          buttonText: 'Add tips', list: [
                            Addtips(buttonText: 'Eating',routName: Eating()),
                            Addtips(buttonText: 'Sleep',routName: Sleep()),
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
                            child: Image.asset('assets/images/adminpic2.jpg')),
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
                              text: 'Number of users :',
                              fontsize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 325,
                            child: Addtips(
                                buttonText: '100 USERS',
                                routName: const Usersinfo()),
                          )
                        ],
                      ),
                    ],
          ),
        ),
      ],
    ));
  }
}
