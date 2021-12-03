import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learn_flutter/models/allergen.dart';
import 'package:learn_flutter/models/food_category.dart';

part 'dish.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Dish {
  final String name;
  final String fileName;
  final FoodCategory category;
  final List<Allergen> allergens;

  const Dish({
    required this.name,
    required this.fileName,
    required this.category,
    required this.allergens,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
  Map<String, dynamic> toJson() => _$DishToJson(this);

  AssetImage get image => AssetImage('images/dishes/$fileName');

  bool match(String query) => name.toLowerCase().contains(query.toLowerCase());

}

