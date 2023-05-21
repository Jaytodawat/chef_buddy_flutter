import 'package:chef_buddy/custom_widgets/custom_buttons.dart';
import 'package:chef_buddy/custom_widgets/icon_box.dart';
import 'package:chef_buddy/custom_widgets/text_icon.dart';
import 'package:chef_buddy/utils/recipe_dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  Future<void> _launchURLBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $uri';
    }
  }

  List<String> getList(String s) {
    return s.split('|');
  }

  @override
  Widget build(BuildContext context) {
    Recipe_Dummy recipe = obj();
    List<String> lst = getList(recipe.ingredients);
    print(lst.toString());
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/recipe_img.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.recipeTitle,
                        style: kSubTextStyle1.copyWith(fontSize: 16),
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "By ${recipe.author}",
                            style: kSubTextStyle.copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextIcon(
                            iconData: Icons.star,
                            text: recipe.rating.toStringAsFixed(2),
                            iconColor: Colors.yellow.shade800,
                          ),
                          TextIcon(
                            iconData: Icons.thumb_up_outlined,
                            text: '${recipe.vote}',
                          ),
                          TextIcon(
                            iconData: Icons.timer_outlined,
                            text: recipe.prepTime,
                          ),
                          TextIcon(
                            iconData: Icons.fastfood_sharp,
                            text: '${recipe.recordHealth.capitalize}',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text("Cuisine : ${recipe.cuisine}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text("Course : ${recipe.course}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text("Diet : ${recipe.diet}"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: kSubTextStyle1.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        recipe.desc,
                        softWrap: true,
                        style: kSubTextStyle.copyWith(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ingredients",
                        style: kSubTextStyle1.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: List.generate(
                          lst.length,
                          (index) => Align(
                            alignment: Alignment.centerLeft,
                            child: Text("${index + 1}. ${lst[index]}"),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: IconBox(
              onPressed: null,
              icon: Icons.arrow_back,
              boxColor: Colors.black,
              iconColor: Colors.white,
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RoundedButton(
                  text: "Go to website",
                  onPressed: () {
                    _launchURLBrowser(recipe.url);
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
