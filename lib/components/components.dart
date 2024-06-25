// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

//الساعات
class LottiPreviewer extends StatelessWidget {
  const LottiPreviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 240,
        width: 240,
        child: Lottie.asset('assets/animations/timer.json', fit: BoxFit.fill));
  }
}

//تغبيش الخلفية
class BlurContainer extends StatelessWidget {
  final double height;
  final double width;
  final double? padding;
  final List<Widget>? list;

  const BlurContainer({
    Key? key,
    required this.height,
    required this.width,
    this.padding,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          height: height,
          width: width,
          padding: padding != null ? EdgeInsets.all(padding!) : null,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: list ?? [],
          ),
        ),
      ),
    );
  }
}

//الاضافة وملحقاتا
class Addtips extends StatelessWidget {
  final String buttonText;
  var routName;
  var routName2;
  final List<Widget>? list;
  final bool? isTips;
  final Function? onpressed;

  Addtips(
      {super.key,
      required this.buttonText,
      this.list,
      this.routName,
      this.routName2,
      this.isTips,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      minWidth: 400,
      color: const Color.fromARGB(255, 49, 0, 71),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 161, 153, 153),
        ),
      ),
      onPressed: () {
        if (list != null) {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return BlurContainer(
                height: 500,
                width: 500,
                list: list,
              );
            },
          );
        } else if (isTips != null && isTips == true) {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(
                      height: 500,
                      width: 550,
                      padding:
                          const EdgeInsets.only(top: 30, left: 15, right: 15),
                      color: Colors.transparent,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            int day = index + 1;
                            return MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(15),
                              color: const Color.fromARGB(255, 49, 0, 71),
                              child: Text('Day $day',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Color.fromARGB(255, 161, 153, 153))),
                              onPressed: () {
                                Get.to(routName2);
                              },
                            );
                          }),
                    ),
                  ),
                );
              });
        } else {
          Get.to(routName);
        }
      },
    );
  }
}

//خانات التعباية
class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData? prefixIcon;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool obscureText;
  final Function(String)? onChanged;
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    this.prefixIcon,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    TextEditingController? controller,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.grey[250],
        filled: true,
        labelText: labelText,
        labelStyle:
            const TextStyle(decorationColor: Color.fromARGB(255, 49, 0, 71)),
        prefixIcon: Icon(
          prefixIcon,
          size: 35,
          color: const Color.fromARGB(255, 49, 0, 71),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 0,
            color: Color.fromARGB(255, 49, 0, 71),
          ),
        ),
      ),
    );
  }
}

//الخلفية الكبيرة مع الشفافية
class BackgroundImage extends StatelessWidget {
  var image;
  BackgroundImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

//تحديد تصنيف التمارين
class CatExercises extends StatelessWidget {
  var selectedValue;
  final Function(int) onChanged;

  CatExercises(
      {required this.selectedValue, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton<int>(
        value: selectedValue.value == 0 ? null : selectedValue.value,
        hint: const Text('Select a Category'),
        items: const [
          DropdownMenuItem(value: 1, child: Text('Weight Loss')),
          DropdownMenuItem(value: 2, child: Text('Muscly Building')),
          DropdownMenuItem(value: 3, child: Text('Flexibility')),
        ],
        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      );
    });
  }
}

//نوع الخط الجديد
class MyText extends StatelessWidget {
  String text;
  var fontsize;
  MyText({required this.text, required this.fontsize, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'Sedan SC',
            fontSize: fontsize,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 49, 0, 71)));
  }
}
// 'assets/images/homepage.jpeg'
