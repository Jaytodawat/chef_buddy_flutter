import 'package:chef_buddy/screens/profile_page.dart';
import 'package:chef_buddy/utils/controllers/auth_controller.dart';
import 'package:chef_buddy/utils/controllers/home_controller.dart';
import 'package:chef_buddy/screens/search_screen.dart';
import 'package:get/get.dart';
import 'package:chef_buddy/constants.dart';
import 'package:chef_buddy/custom_widgets/custom_buttons.dart';
import 'package:chef_buddy/custom_widgets/icon_box.dart';
import 'package:chef_buddy/custom_widgets/recipe_card.dart';
import 'package:chef_buddy/screens/bottom_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:chef_buddy/utils/recipe.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  bool flag = true;
  // void getD() async {
  //   await HomeController().getData();
  // }

  @override
  Widget build(BuildContext context) {
    // getD();
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: HomeController(),
        builder: (homeController) {
          // getD();
          // homeController.getData();
          print(homeController.recipes.length);
          flag = false;
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                color: Colors.white,
                backgroundColor: Colors.black,
                items: [
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.home_filled,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const BottomModalSheet();
                          });
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      authController.logout();
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.white,
              body: Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconBox(
                          onPressed: null,
                          icon: Icons.menu,
                          boxColor: kWhite,
                          iconColor: Colors.black,
                        ),
                        IconBox(
                          onPressed: (){
                            Get.to(const ProfilePage());
                          },
                          icon: Icons.person,
                          iconColor: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Delicious',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Easy to cook menu',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const SearchScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        constraints:
                            BoxConstraints.tightFor(width: screenWidth),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(
                              color: Colors.black38,
                            )),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text(
                              "Search your perfect recipe",
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Popular',
                        style: kSubTextStyle1,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Row(
                          children: const [
                            'All',
                            'BreakFast',
                            'Lunch',
                            'Dinner',
                            'Indian'
                          ]
                              .map((e) =>
                                  RoundedSubButton(onPressed: null, text: e))
                              .toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: homeController.recipes.isEmpty
                          ? const Center(
                              child: Text("No Products to show"),
                            )
                          : ListView.builder(
                              physics: const ScrollPhysics(),
                              itemCount: homeController.recipes.length,
                              itemBuilder: (context, index) {
                                return RecipeCard(index: index);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
