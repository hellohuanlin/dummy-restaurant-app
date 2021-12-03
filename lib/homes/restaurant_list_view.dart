import 'package:flutter/material.dart';
import 'package:learn_flutter/models/restaurant.dart';

typedef OnTapRestaurant = Function(BuildContext context, Restaurant restaurant);

class RestaurantListView extends StatelessWidget {
  final List<Restaurant> restaurants;
  final OnTapRestaurant onTapRestaurant;
  const RestaurantListView({Key? key, required this.restaurants, required this.onTapRestaurant}) : super(key: key);

  Widget _buildRow(BuildContext context, Restaurant restaurant) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(restaurant.name),
        trailing: Image(image: restaurant.image),
        onTap: () { onTapRestaurant(context, restaurant); },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) => _buildRow(context, restaurants[index])
    );
  }
}


