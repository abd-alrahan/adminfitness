import 'package:adminfitness/components/components.dart';
import 'package:adminfitness/login/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/login1.jpeg'),
            ),
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  margin: const EdgeInsets.only(top: 30, left: 60),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/logoapp.png'),
                    ),
                  ),
                ),
                Container(
                  width: 320,
                  margin: const EdgeInsets.only(top: 50, left: 950, bottom: 50),
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        text: 'LOGIN',
                        fontsize: 40,
                      ),
                      const SizedBox(height: 60),
                      CustomTextFormField(
                        onChanged: (text) {
                          _loginController.email.value = text;
                        },
                        labelText: 'Email',
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        onChanged: (text) {
                          _loginController.password.value = text;
                        },
                        labelText: 'Password',
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 35),
                      Obx(() {
                        return _loginController.isLoading.value
                            ? const CircularProgressIndicator()
                            : MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.all(15),
                                minWidth: 400,
                                color: const Color.fromARGB(255, 49, 0, 71),
                                onPressed: _loginController.login,
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 161, 153, 153),
                                  ),
                                ),
                              );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
