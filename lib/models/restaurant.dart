
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learn_flutter/models/location.dart';
import 'dish.dart';

part 'restaurant.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Restaurant {
  final String name;
  final String fileName;
  final String website;
  final Location location;
  final List<Dish> dishes;

  const Restaurant({required this.name, required this.fileName, required this.website, required this.dishes, required this.location});

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  AssetImage get image {
    return AssetImage("images/restaurants/$fileName");
  }

}
