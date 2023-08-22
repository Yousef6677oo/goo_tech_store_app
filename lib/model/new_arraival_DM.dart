class NewArrivalDM {
  String? name;
  String? imagePath;
  double? price;
  String? category;
  String? subCategory;
  String? description;
  List<String>? listOfSize;
  List<String>? listOfImages;

  NewArrivalDM(
      {required this.imagePath,
      required this.name,
      required this.category,
      required this.description,
      required this.listOfSize,
      required this.price,
      required this.subCategory,
      required this.listOfImages});
}
