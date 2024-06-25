// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:adminfitness/components/components.dart';
import 'package:adminfitness/constants/constants.dart';
import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/addtips_service.dart';
import 'package:flutter/material.dart';

class Eating extends StatefulWidget {
  const Eating({super.key});

  @override
  State<Eating> createState() => _EatingState();
}

class _EatingState extends State<Eating> {
  final _formKey = GlobalKey<FormState>();
  final AddtipsService addtipsService = AddtipsService();
  bool isLoading = false;
  String description = '';
  int category_id = catMap['eating'];
  

  void _addtip() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      print('in screen $description');
      TipsModel tipsModel = TipsModel(
        description: description,
        category_id: category_id,
      );
      // LogInModel loginModel = LogInModel(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      bool success = await addtipsService.tips(tipsModel);

      setState(() {
        isLoading = false;
      });

      if (success) {
        print(description);
        print(category_id);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('add tip faild. Please try again.')),
        );
      }
    }
  }

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
                  MyText(text: 'eating tips', fontsize: 40),
                  MyText(
                      text:
                          'make your tips effective, the more healthy they are the perfect following eating tips!!',
                      fontsize: 20),
                   CustomTextFormField(
                    onChanged: (text) {
                          description = text;
                        },
                      labelText: 'description of the tip'),
                  SizedBox(
                    width: 225,
                    height: 35,
                    child: SizedBox(
                      height: 35,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.all(15),
                              minWidth: 400,
                              color: const Color.fromARGB(255, 49, 0, 71),
                             
                              child: const Text(
                                'submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 161, 153, 153),
                                ),
                              ),
                               onPressed: _addtip,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
