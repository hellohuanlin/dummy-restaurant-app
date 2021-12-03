import 'package:flutter/material.dart';
import 'package:learn_flutter/data/restaurant_data_source.dart';
import 'package:learn_flutter/homes/home_screen.dart';
import 'package:learn_flutter/homes/inherited_home_widget.dart';

void main() {

  runApp(const MaterialApp(
    title: "Restaurant App",
    home: InheritedHomeWidget(
        restaurantDataSource: RestaurantDataSource(),
        child: HomeScreen()
    ),
  ));
}


