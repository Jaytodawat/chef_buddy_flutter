import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../recipe.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  // RxList<Recipe> recipes = RxList<Recipe>([]);
  final int _perPage = 10;
  var recipes = <Recipe>[];
  var searchRecipe = <Recipe>[];
  bool loadingProducts = true.obs();
  late DocumentSnapshot _lastDocument;
  late DocumentSnapshot _lastSearchDocument;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getData();

    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      if(currentScroll == maxScroll){
        getMoreData();
      }
    });
    // collectionReference = firebaseFirestore.collection("recipes");
    // recipes.bindStream(getAllRecipes());
  }

  Future<void> getData() async {
    try {
      final collection = firebaseFirestore.collection("recipes");
      Query query = collection
          .where("vote_count", isGreaterThan: 1000)
          .orderBy("vote_count")
          .limit(_perPage);
      QuerySnapshot rec = await query.get();
      for (var re in rec.docs) {
        recipes.add(Recipe.fromMap(re));
      }
      _lastDocument = rec.docs[rec.docs.length - 1];
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    }
    update();
  }


  Future<void> searchData() async {
    try {
      final collection = firebaseFirestore.collection("recipes");
      Query query = collection
          .where("vote_count", isGreaterThan: 1000)
          .orderBy("vote_count")
          .startAfterDocument(_lastSearchDocument).limit(_perPage);
      QuerySnapshot rec = await query.get();
      for (var re in rec.docs) {
        searchRecipe.add(Recipe.fromMap(re));
      }
      _lastDocument = rec.docs[rec.docs.length - 1];

    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> getMoreData() async {
    try {
      final collection = firebaseFirestore.collection("recipes");
      Query query = collection
          .where("vote_count", isGreaterThan: 1000)
          .orderBy("vote_count")
          .startAfterDocument(_lastDocument).limit(_perPage);
      QuerySnapshot rec = await query.get();
      for (var re in rec.docs) {
        recipes.add(Recipe.fromMap(re));
      }
      _lastDocument = rec.docs[rec.docs.length - 1];
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    }
    update();
  }

  // Stream<List<Recipe>> getAllRecipes() => collectionReference
  //     .snapshots()
  //     .map((query) => query.docs.map((item) => Recipe.fromMap(item)).toList());
}
