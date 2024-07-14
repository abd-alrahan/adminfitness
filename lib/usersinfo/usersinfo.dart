import 'package:adminfitness/models/models.dart';
import 'package:adminfitness/usersinfo/numuserController.dart';
import 'package:adminfitness/usersinfo/usersinfoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adminfitness/components/components.dart';

class Usersinfo extends StatelessWidget {
  Usersinfo({super.key});

  final UserinfoController usersController = Get.put(UserinfoController());
  final NumuserController numuserController = Get.put(NumuserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: 'assets/images/homepage.jpeg'),
          Center(
            child: BlurContainer(
              height: 600,
              width: 600,
              list: [
                Column(
                  children: [
                    MyText(text: 'The number of users: ', fontsize: 40),
                    const SizedBox(height: 15),
                    Obx(() {
                      if (numuserController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (numuserController.errorMessage.isNotEmpty) {
                        return Center(
                            child: Text(numuserController.errorMessage.value));
                      } else {
                        return MyText(
                            text: '${numuserController.userCount.value} users',
                            fontsize: 35);
                      }
                    }),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    child: Obx(() {
                      if (usersController.errorMessage.isNotEmpty) {
                        return Center(
                            child: Text(usersController.errorMessage.value));
                      } else if (usersController.users.isEmpty) {
                        return const Center(child: Text('No users found'));
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: usersController.users.length,
                          itemBuilder: (context, index) {
                            UserModel user = usersController.users[index];
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/adminpic2.jpg'),
                                          radius: 50,
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                user.name,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Center(child: Text(user.email)),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Center(
                                                child:
                                                    Text('Age: ${user.age}')),
                                            Center(
                                                child: Text(
                                                    'Height: ${user.tall} cm')),
                                            Center(
                                                child: Text(
                                                    'Weight: ${user.weight} kg')),
                                            Center(
                                                child: Text(
                                                    'Gender: ${user.gender}')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      height: 25,
                                      width: 50,
                                      child: MaterialButton(
                                        color: Colors.red,
                                        textColor: Colors.white,
                                        child: const Text(
                                          'Remove',
                                          style: TextStyle(fontSize: 9.3),
                                        ),
                                        onPressed: () {
                                          // Implement the remove functionality here
                                        },
                                      ),
                                    ),
                                  ),
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
