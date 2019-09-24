class Items {
  bool suceess;
  List<Category> cat;

  Items({this.suceess, this.cat});
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      suceess: json["success"],
      cat: Category.fromJson(json["data"]) as List,
    );
  }
}

