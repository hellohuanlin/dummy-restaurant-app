import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:learn_flutter/data/restaurant_data.dart';
import 'package:learn_flutter/models/restaurant.dart';

class RestaurantDataSource {

  const RestaurantDataSource();

  Future<List<Restaurant>> fetchRestaurantData() async {
    final string = await rootBundle.loadString('data/restaurants.json');
    final json = await jsonDecode(string);

    // Mimic network delay
    await Future.delayed(const Duration(seconds: 3));
    return RestaurantData.fromJson(json).restaurants;
  }

}