import 'package:adminfitness/cattips/eating/show_eating/delete_tipController.dart';
import 'package:adminfitness/cattips/eating/show_eating/show_eatingController.dart';
import 'package:adminfitness/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowEating extends StatelessWidget {
  const ShowEating({super.key});

  @override
  Widget build(BuildContext context) {
    final ShowEatingController showeatingController =
        Get.put(ShowEatingController());
    final DeleteTipController deleteTipController =
        Get.put(DeleteTipController());

    showeatingController.fetchTips(showeatingController.categoryId);
    // // Fetch the tips when the widget is initialized
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showeatingController.fetchTips(showeatingController.categoryId);
    // });

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: 'assets/images/homepage.jpeg'),
          Align(alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 225,
            child: Addtips(buttonText: 'Go to Home Page',routName: '/home'),
          ),
          ),
          Center(
            child: BlurContainer(
              height: 600,
              width: 600,
              list: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: MyText(text: 'Eating Tips:', fontsize: 40),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    child: Obx(() {
                      if (showeatingController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (showeatingController.errorMessage.isNotEmpty) {
                        return Center(
                            child:
                                Text(showeatingController.errorMessage.value));
                      } else if (showeatingController.tipsList.isEmpty) {
                        return const Center(child: Text('No tips found'));
                      } else {
                        return ListView.builder(
                          itemCount: showeatingController.tipsList.length,
                          itemBuilder: (context, index) {
                            var tip = showeatingController.tipsList[index];
                            return Container(
                              height: 70,
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: Text(
                                      tip.description,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Obx(() {
                                          return deleteTipController
                                                      .loadingTips[tip.id] ==
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
                                                    if (tip.id != null) {
                                                      await deleteTipController
                                                          .deleteTip(tip
                                                              .id!); // Call delete method
                                                      showeatingController
                                                          .tipsList
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
