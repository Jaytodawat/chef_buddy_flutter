import 'package:flutter/material.dart';
import '../constants.dart';
import '../recipe.dart';
import 'icon_box.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({super.key,required this.index, });
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Colors.white,
        elevation: 1,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            // color: Colors.grey.shade50,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                  color: Colors.grey.shade200
              )

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex : 1,
                child: Image(image: AssetImage('assets/images/recipe.png'),),),
              Expanded(
                flex: 2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data[index].recName,
                      style: kSubTextStyle1.copyWith(fontSize: 12),
                      softWrap: false,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text(data[index].chefName, style: kSubTextStyle.copyWith(color: Colors.grey.shade900,fontSize: 10),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              IconBox(onPressed: null, icon: Icons.arrow_forward, boxColor: Colors.black, iconColor: Colors.white,)
              // IconButton(onPressed: null, icon: Icon(Icons.arrow_forward))
            ],

          ),
        ),
      ),
    );
  }
}
