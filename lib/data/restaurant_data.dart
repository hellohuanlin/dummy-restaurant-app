import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learn_flutter/models/restaurant.dart';

part 'restaurant_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RestaurantData {
  final List<Restaurant> restaurants;

  const RestaurantData({required this.restaurants});

  factory RestaurantData.fromJson(Map<String, dynamic> json) => _$RestaurantDataFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantDataToJson(this);


}



