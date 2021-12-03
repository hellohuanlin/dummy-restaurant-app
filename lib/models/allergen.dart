import 'package:flutter/foundation.dart';

enum Allergen {
  peanut,
  egg,
  milk,
  fish,
  shrimp,
}

extension Description on List<Allergen> {
  String get description {
    if (isEmpty) {
      return "";
    }
    return "WARNING:" + map((it) => describeEnum(it).toUpperCase()).join(", ");
  }
}