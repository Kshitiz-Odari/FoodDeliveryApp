//import 'package:flutter/material.dart';

//food item
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<AddOn> availableAddOns;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddOns,
  });
}

//category
enum FoodCategory {
  vegs,
  nonvegs,
  salads,
  sides,
  desserts,
  drinks,
}

class AddOn {
  String name;
  double price;

  AddOn({
    required this.name,
    required this.price,
  });
}
