// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:adminfitness/catdeits/flexibility/flexibilityd.dart';
import 'package:adminfitness/catdeits/muscly%20building/musclybuildd.dart';
import 'package:adminfitness/catdeits/weight%20loss/weightlossd.dart';
import 'package:adminfitness/catexercises/flexibilitye.dart';
import 'package:adminfitness/catexercises/musclybuilde.dart';
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
                  child: Addtips(
                    buttonText: 'Add exercises',
                    list: [
                      Addtips(
                          buttonText: 'Weight Loss Exercise',
                          routName: Weightlosse()),
                      Addtips(
                          buttonText: 'Muscly Building Exercise',
                          routName: Musclybuilde()),
                      Addtips(
                          buttonText: 'Flexibility Exercise',
                          routName: Flexibilitye()),
                    ],
                  )),
              SizedBox(
                height: 100,
                width: 250,
                child: Addtips(
                  buttonText: 'Add deits',
                  list: [
                    Addtips(
                        buttonText: 'Weight Loss Deit',
                        routName: Weightlossd()),
                    Addtips(
                        buttonText: 'Muscly Building Deit',
                        routName: Musclybuildd()),
                    Addtips(
                        buttonText: 'Flexibility Deit',
                        routName: Flexibilityd()),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 250,
                child: Addtips(
                  buttonText: 'Add tips',
                  list: [
                    Addtips(buttonText: 'Eating', routName: Eating()),
                    Addtips(buttonText: 'Sleep', routName: Sleep()),
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
                        buttonText: '100 USERS', routName: const Usersinfo()),
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
