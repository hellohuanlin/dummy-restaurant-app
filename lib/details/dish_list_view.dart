import 'package:flutter/material.dart';
import 'package:learn_flutter/models/dish.dart';
import 'package:learn_flutter/models/restaurant.dart';
import 'package:learn_flutter/models/allergen.dart';
import 'package:learn_flutter/models/food_category.dart';


class DishListView extends StatelessWidget {

  final Restaurant restaurant;

  const DishListView({Key? key, required this.restaurant}) : super(key: key);

  Widget _buildRow(Dish dish) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text('${dish.name} (${dish.category.description})'),
        subtitle: Text(dish.allergens.description),
        trailing: Image(image: dish.image,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurant.dishes.length,
      itemBuilder: (context, index) => _buildRow(restaurant.dishes[index]),
    );
  }
}
