import 'package:flutter/foundation.dart';

enum FoodCategory {
  japanese,
  italian,
  vegetarian,
  misc,
}

extension Description on FoodCategory {
  String get description {
    return describeEnum(this).toUpperCase();
  }
}