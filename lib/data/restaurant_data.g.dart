// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantData _$RestaurantDataFromJson(Map<String, dynamic> json) =>
    RestaurantData(
      restaurants: (json['restaurants'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantDataToJson(RestaurantData instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants.map((e) => e.toJson()).toList(),
    };
