import 'package:chef_buddy/screens/recipe_screen.dart';
import 'package:chef_buddy/utils/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../utils/recipe.dart';
import 'icon_box.dart';
import 'package:get/get.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({
    super.key,
    required this.index,
  });
  HomeController homeController = Get.find();
  int index;
  // late List<Recipe> data;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          // homeController.getData();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Material(
              color: Colors.white,
              elevation: 1,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    // color: Colors.grey.shade50,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.grey.shade200)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Image(
                        image: AssetImage('assets/images/recipe.png'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            homeController.recipes[index].recipeTitle,
                            style: kSubTextStyle1.copyWith(fontSize: 12),
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.person),
                              Text(
                                homeController.recipes[index].chefName,
                                style: kSubTextStyle.copyWith(
                                    color: Colors.grey.shade900, fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconBox(
                      onPressed: (){
                        Get.to(const RecipePage());
                      },
                      icon: Icons.arrow_forward,
                      boxColor: Colors.black,
                      iconColor: Colors.white,
                    )
                    // IconButton(onPressed: null, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
