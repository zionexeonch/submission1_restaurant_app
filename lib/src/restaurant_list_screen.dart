import 'package:flutter/material.dart';

import '../model/restaurant.dart';
import 'restaurant_detail_screen.dart';

class RestaurantList extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantList({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(restaurants[index].name),
          subtitle: Text(restaurants[index].city),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetail(
                  restaurant: restaurants[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
