import 'package:chef_buddy/constants.dart';
import 'package:chef_buddy/custom_widgets/custom_buttons.dart';
import 'package:chef_buddy/custom_widgets/icon_box.dart';
import 'package:chef_buddy/custom_widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:chef_buddy/recipe.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          backgroundColor: Colors.black,
          items: const [
            IconButton(
              onPressed: null,
              icon:Icon(Icons.home_filled, color: Colors.black, ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.bookmark_add,
                color: Colors.black,
              ),
            )
          ],

        ),
        backgroundColor: Colors.white,
        body:Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBox(onPressed: null, icon: Icons.menu, boxColor: kWhite, iconColor: Colors.black,),
                    IconBox(onPressed: null, icon: Icons.notifications, boxColor: kFaintGreen, iconColor: kWhite,),
                  ],
                ),

                const SizedBox(height: 15,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Delicious',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey

                  ),),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Easy to cook menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                ),

                const SizedBox(height: 25,),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    prefixIconColor: Colors.black,
                    hintText: 'Search your perfect recipe',
                    hintStyle: kSubTextStyle.copyWith(fontSize: 14),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),

                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Popular',
                    style: kSubTextStyle1,),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Row(
                      children: const [
                        'All',
                        'BreakFast',
                        'Lunch'
                        'Dinner',
                        'Indian'
                      ].map((e) => RoundedSubButton(onPressed: null, text: e)).toList(),
                    ),
                    // RoundedSubButton(onPressed: null, text: 'All'),
                    // RoundedSubButton(onPressed: null, text: 'Breakfast'),
                    // RoundedSubButton(onPressed: null, text: 'Lunch'),
                    // RoundedSubButton(onPressed: null, text: 'Dinner'),
                    // RoundedSubButton(onPressed: null, text: 'Indian'),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index){
                      return RecipeCard(index: index);
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
