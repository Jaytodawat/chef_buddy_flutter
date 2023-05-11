

import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe{
  String? docId;
  late String course;
  late String desc;
  late String diet;
  late String recipeTitle;
  late String recordHealth;
  late double rating;
  late int vote;
  late String url;
  String chefName = "Pooja Thakur";

  Recipe({this.docId, required this.course, required this.desc, required this.diet, required this.recipeTitle, required this.recordHealth, required this.rating, required this.vote, required this.url});

  Recipe.fromMap(DocumentSnapshot data){
    docId = data.id;
    recipeTitle = data["recipe_title"];
    course = data["course"];
    desc = data["description"];
    diet = data["diet"];
    recordHealth = data["record_health"];
    rating = data["rating"];
    vote = data["vote_count"];
    url = data["url"];
  }
}
