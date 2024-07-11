import 'package:flutter/material.dart';
import 'package:adminfitness/components/components.dart';

class Usersinfo extends StatelessWidget {
  const Usersinfo({super.key});

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
                Column(children: [
                  MyText(text: 'The number of users : ', fontsize: 40),
                  const SizedBox(height: 15),
                  MyText(text: '100 users', fontsize: 35),
                ]),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              const Center(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/adminpic2.jpg'),
                                      radius: 50,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            'user.name',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Center(child: Text('user.email')),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Center(child: Text('Age: ')),
                                        Center(child: Text('Height:  cm')),
                                        Center(child: Text('Weight:  kg')),
                                        Center(child: Text('Gender: ')),
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
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
