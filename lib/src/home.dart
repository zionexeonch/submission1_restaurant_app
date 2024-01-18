import 'package:flutter/material.dart';

import '../model/restaurant.dart';
import 'restaurant_list_screen.dart';
import 'restaurant_service.dart';

class MyHomePage extends StatelessWidget {
  final RestaurantService _restaurantService = RestaurantService();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<List<Restaurant>>(
        // Fetch restaurant data and populate the list
        future: _restaurantService.getRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return RestaurantList(restaurants: snapshot.data!);
          }
        },
      ),
    );
  }
}
