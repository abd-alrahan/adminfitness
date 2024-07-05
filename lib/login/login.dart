// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, sort_child_properties_last

import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/serveices/login_service.dart';
import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginService loginService = LoginService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String email = '', password = '';
  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      print('in screen $email');
      LogInModel loginModel = LogInModel(
        email: email,
        password: password,
      );
      // LogInModel loginModel = LogInModel(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      bool success = await loginService.login(loginModel);

      setState(() {
        isLoading = false;
      });

      if (success) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    }
  }

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
                //صورة اللوغو
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
                //المربع تبع اللوغ ان
                Container(
                  width: 320,
                  margin: const EdgeInsets.only(top: 50, left: 950, bottom: 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
                          email = text;
                        },
                        controller: emailController,
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
                          password = text;
                        },
                        controller: passwordController,
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
                      isLoading
                          ? const CircularProgressIndicator()
                          : MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.all(15),
                              minWidth: 400,
                              color: const Color.fromARGB(255, 49, 0, 71),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 161, 153, 153),
                                ),
                              ),
                              onPressed: _login,
                            ),
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
