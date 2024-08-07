import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/catdeits/flexibility/flexibilityd.dart';
import 'package:adminfitness/catdeits/flexibility/show_flexibilityd.dart';
import 'package:adminfitness/catdeits/muscly%20building/musclybuildd.dart';
import 'package:adminfitness/catdeits/muscly%20building/show_musclybuildd.dart';
import 'package:adminfitness/catdeits/weight%20loss/show_weightloss/show_weightlossd.dart';
import 'package:adminfitness/catdeits/weight%20loss/weightlossd.dart';
import 'package:adminfitness/catexercises/flexibilitye.dart';
import 'package:adminfitness/catexercises/musclybuilde.dart';
import 'package:adminfitness/catexercises/weightlosse.dart';
import 'package:adminfitness/cattips/eating/eating.dart';
import 'package:adminfitness/cattips/eating/show_eating/show_eating.dart';
import 'package:adminfitness/cattips/sleep/show_sleep/show_sleep.dart';
import 'package:adminfitness/cattips/sleep/sleep.dart';
import 'package:adminfitness/homepage/homepage.dart';
import 'package:adminfitness/login/login.dart';
import 'package:adminfitness/usersinfo/usersinfo.dart';
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
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/', page: () => LogIn()),
        GetPage(name: '/home', page: () => const Homepage()),
        GetPage(name: '/weightlossd', page: () => Weightlossd()),
        GetPage(name: '/musclybuildd', page: () => Musclybuildd()),
        GetPage(name: '/flexibilityd', page: () => Flexibilityd()),
        GetPage(name: '/weightlosse', page: () => Weightlosse()),
        GetPage(name: '/musclybuilde', page: () => Musclybuilde()),
        GetPage(name: '/flexibilitye', page: () => Flexibilitye()),
        GetPage(name: '/eating', page: () => Eating()),
        GetPage(name: '/sleep', page: () => Sleep()),
        GetPage(name: '/usersinfo', page: () => Usersinfo()),
        GetPage(name: '/showeating', page: () => const ShowEating()),
        GetPage(name: '/showsleep', page: () => const ShowSleep()),
        GetPage(name: '/showweightlossd', page: () =>  ShowWeightlossd()),
        GetPage(name: '/showmusclybuildd', page: () =>  ShowMusclybuildd()),
        GetPage(name: '/showflexibilityd', page: () =>  ShowFlexibilityd()),
      ],
    );
  }
}
