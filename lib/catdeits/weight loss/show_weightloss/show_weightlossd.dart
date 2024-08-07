import 'package:adminfitness/catdeits/weight%20loss/deleteDietsController.dart';
import 'package:adminfitness/catdeits/weight%20loss/showDietsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adminfitness/catdeits/weight%20loss/weightlossd.dart';
import 'package:adminfitness/components/components.dart';

class ShowWeightlossd extends StatelessWidget {
  ShowWeightlossd({super.key});

  final ShowDietsController showDietsController = Get.put(ShowDietsController());
  final DayController dayController = Get.put(DayController());
  final DeleteDietsController deleteDietsController = Get.put(DeleteDietsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: 'assets/images/homepage.jpeg'),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 225,
              child: Addtips(buttonText: 'Go to Home Page', routName: '/home'),
            ),
          ),
          Center(
            child: BlurContainer(
              height: 600,
              width: 600,
              list: [
                MyText(text: 'Weight loss Diets', fontsize: 40),
                const SizedBox(height: 20),
                Obx(() {
                  return DropdownButton<int>(
                    value: dayController.selectedDay.value == 0
                        ? null
                        : dayController.selectedDay.value,
                    hint: const Text('Select a Day'),
                    items: List.generate(15, (index) => index + 1)
                        .map((day) => DropdownMenuItem(
                              value: day,
                              child: Text('Day $day'),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        dayController.setSelectedDay(value);
                        showDietsController.fetchDietsByDayId(value);
                      }
                    },
                  );
                }),
                const SizedBox(height: 15),
                Expanded(
                  child: Obx(() {
                    if (showDietsController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (showDietsController.errorMessage.value.isNotEmpty) {
                      return Center(
                          child: Text(showDietsController.errorMessage.value));
                    } else if (showDietsController.dietsList.isEmpty) {
                      return const Center(child: Text('No diets found'));
                    } else {
                      return ListView.builder(
                        itemCount: showDietsController.dietsList.length,
                        itemBuilder: (context, index) {
                          var diet = showDietsController.dietsList[index];
                          print('IN UIIIIIIIIIIIIIII');
                          print(diet.image);
                          print('the diet id : ${diet.id}');
                          print('the diet dayId : ${diet.day_id}');
                          return Container(
                            height: 125,
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'http://localhost:8000/images/recipes/1722883742_upload_image.jpg'))),
                                ),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Time: ${diet.time}'),
                                        const SizedBox(height: 5),
                                        Text(
                                            'Description: ${diet.description}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Obx(() {
                                          return deleteDietsController
                                                      .loadingTips[diet.id] ==
                                                  true
                                              ? const Center(
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                            strokeWidth: 2.0),
                                                  ),
                                                )
                                              : MaterialButton(
                                                  color: Colors.red,
                                                  textColor: Colors.white,
                                                  child: const Text(
                                                    'Remove',
                                                    style: TextStyle(
                                                        fontSize: 9.3),
                                                  ),
                                                  onPressed: () async {
                                                    if (diet.id != null) {
                                                      await deleteDietsController
                                                          .deleteDiet(diet
                                                              .day_id, diet.id!); // Call delete method
                                                      showDietsController
                                                          .dietsList
                                                          .removeAt(index);
                                                    } else {
                                                      // Handle the case where id is null
                                                      Get.snackbar('Error',
                                                          'Tip ID is not available');
                                                    }
                                                  },
                                                );
                                        }),
                                      )),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
