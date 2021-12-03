import 'package:flutter/material.dart';
import 'package:learn_flutter/data/restaurant_data_source.dart';

class InheritedHomeWidget extends InheritedWidget {
  const InheritedHomeWidget({Key? key, required this.restaurantDataSource, required Widget child}) : super(key: key, child: child);

  final RestaurantDataSource restaurantDataSource;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}