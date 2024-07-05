import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/homepage/homepage.dart';
import 'package:adminfitness/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  DioHelper.init();
  runApp(const Admin());
}

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LogIn()),
        GetPage(name: '/home', page: () => const Homepage()),
      ],
    );
  }
}
