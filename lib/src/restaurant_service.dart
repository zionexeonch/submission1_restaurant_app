import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/restaurant.dart';

class RestaurantService {
  Future<List<Restaurant>> getRestaurants() async {
    // Load data from restaurant.json in the assets folder
    final String jsonString =
        await rootBundle.loadString('assets/restaurant.json');
    final Map<String, dynamic> data = json.decode(jsonString);
    final List<dynamic> restaurantsData = data['restaurants'];

    // Convert data to a list of Restaurant objects
    final List<Restaurant> restaurants = restaurantsData
        .map((restaurantData) => Restaurant.fromJson(restaurantData))
        .toList();

    return restaurants;
  }
}
