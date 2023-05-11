import 'package:chef_buddy/utils/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../custom_widgets/recipe_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (homeController) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back)),
                        // SizedBox(width: 5,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search_rounded),
                              prefixIconColor: Colors.black,
                              hintText: 'Search',
                              hintStyle: kSubTextStyle.copyWith(fontSize: 14),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: homeController.recipes.isEmpty
                          ? const Center(
                              child: Text("No Products to show"),
                            )
                          : ListView.builder(
                              controller: homeController.scrollController,
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
