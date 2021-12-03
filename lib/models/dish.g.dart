// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      name: json['name'] as String,
      fileName: json['file_name'] as String,
      category: $enumDecode(_$FoodCategoryEnumMap, json['category']),
      allergens: (json['allergens'] as List<dynamic>)
          .map((e) => $enumDecode(_$AllergenEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'name': instance.name,
      'file_name': instance.fileName,
      'category': _$FoodCategoryEnumMap[instance.category],
      'allergens': instance.allergens.map((e) => _$AllergenEnumMap[e]).toList(),
    };

const _$FoodCategoryEnumMap = {
  FoodCategory.japanese: 'japanese',
  FoodCategory.italian: 'italian',
  FoodCategory.vegetarian: 'vegetarian',
  FoodCategory.misc: 'misc',
};

const _$AllergenEnumMap = {
  Allergen.peanut: 'peanut',
  Allergen.egg: 'egg',
  Allergen.milk: 'milk',
  Allergen.fish: 'fish',
  Allergen.shrimp: 'shrimp',
};
