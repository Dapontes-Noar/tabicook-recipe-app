import 'package:flutter/material.dart';

class AppImages {
  static const String placeholderFood = 'assets/images/placeholder_food.png';

  static const Widget placeholderFoodWidget = Image(
    image: AssetImage(placeholderFood),
    fit: BoxFit.cover,
  );
}
