import 'package:flutter/material.dart';
import 'package:pet_card/utils/my_colors.dart';

class PetProfile extends StatelessWidget {
  const PetProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> petInfo = {
      'name': "Jeanna",
      'raze': "Schnauzer",
      'age': "6 old",
      'weight': "18.2 kg",
      'sex': "male"
    };

    return Container(
      color: MyColors.purpleOne,
      child: Column(
        children: [
          Text(
            petInfo['name'].toString(),
            style: const TextStyle(
                color: MyColors.ripeOrange,
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
          Text(
            petInfo['raze'].toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 105,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: MyColors.grayBack,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                    Border.all(color: MyColors.grayMuted),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  padding:
                                  const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                  child: Column(
                                    children: [
                                      Text(
                                        petInfo['age'].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "Age",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                    Border.all(color: MyColors.grayMuted),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  padding:
                                  const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                  child: Column(
                                    children: [
                                      Text(
                                        petInfo['weight'].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "Weight",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                    Border.all(color: MyColors.grayMuted),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  padding:
                                  const EdgeInsets.fromLTRB(20, 12, 20, 12),
                                  child: Column(
                                    children: [
                                      Text(
                                        petInfo['sex'].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "Sex",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: const [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Events"),
                                ),
                                Card(
                                  child: ListTile(
                                    title: Text('Next Event'),
                                    subtitle: Text("Wednesday, 1 april 2022"),
                                    trailing: Text("in 1 wk \n 15:00"),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: const [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Health"),
                                ),
                                Card(
                                  elevation: 2,
                                  child: ListTile(
                                    title: Text('Weight'),
                                    subtitle: Text("18,2"),
                                    trailing: Text("see all"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Positioned(
                top: 0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/schnauzer.jpg"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
