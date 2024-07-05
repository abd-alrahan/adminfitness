import 'package:adminfitness/components/components.dart';
import 'package:flutter/material.dart';

class Sleep extends StatelessWidget {
  const Sleep({super.key});

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
                  MyText(text: 'make your tips comfortable, the best way to get healthy the perfect sleep tips!!', fontsize: 20),
                  const CustomTextFormField(labelText: 'description of the tip'),
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