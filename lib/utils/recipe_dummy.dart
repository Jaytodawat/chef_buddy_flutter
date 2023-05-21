class Recipe_Dummy {
  String? docId;

  late String recipeTitle;
  late String url;
  late String recordHealth;
  late int vote;
  late double rating;
  late String desc;
  late String cuisine;
  late String course;
  late String diet;
  late String prepTime;
  late String cookTime;
  late String ingredients;
  late String author;
  late String tags;

  Recipe_Dummy({
    this.docId,
    required this.recipeTitle,
    required this.url,
    required this.recordHealth,
    required this.vote,
    required this.rating,
    required this.desc,
    required this.cuisine,
    required this.course,
    required this.diet,
    required this.prepTime,
    required this.cookTime,
    required this.ingredients,
    required this.author,
    required this.tags,
  });

  // Recipe_Dummy.fromMap(DocumentSnapshot data){
  //   docId = data.id;
  //   recipeTitle = data["recipe_title"];
  //   course = data["course"];
  //   desc = data["description"];
  //   diet = data["diet"];
  //   recordHealth = data["record_health"];
  //   rating = data["rating"];
  //   vote = data["vote_count"];
  //   url = data["url"];
  // }
}

Recipe_Dummy obj() {
  Recipe_Dummy dummy = Recipe_Dummy(
      recipeTitle: "Roasted Peppers And Mushroom Tortilla Pizza Recipe",
      url:
          "https://www.archanaskitchen.com/roasted-peppers-and-mushroom-tortilla-pizza-recipe",
      recordHealth: "good",
      vote: 434,
      rating: 4.958525346,
      desc:
          " It is a quicker version pizza to satisfy your cravings. It is a very quick and easy recipe for days that you do not feel like cooking a full fledged meal. With the preference of toppings of your choice this pizza recipe is definitely a winner at any home. The toppings used in this  has some roasted peppers, mushroom with loaded cheese and marinara sauce. Enjoy this easy recipe with your favorite toppings.Â  This is a great recipe, if you are looking for an Indian/Fusion Pizza or a Homemade Pizza recipe. Serve  along with  Â and   for a weekend night dinner. If you like this recipe, you can also try other  for your weekend dinner:",
      cuisine: "Mexican",
      course: "Dinner",
      diet: "Vegetarian",
      prepTime: "15 M",
      cookTime: "15 M",
      ingredients:
          "Tortillas|Extra Virgin Olive Oil|Garlic|Mozzarella cheese|Red Yellow or Green Bell Pepper (Capsicum)|Onions|Kalmatta olives|Button mushrooms",
      author: "Divya Shivaraman ",
      tags:
          "Party Food Recipes|Tea Party Recipes|Mushroom Recipes|Fusion Recipes|Tortilla Recipe|Bell Peppers Recipes");
  return dummy;
}
