import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

import '../model/restaurant.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetail({super.key, required this.restaurant});

  @override
  // ignore: library_private_types_in_public_api
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.restaurant.pictureId,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 8.0),
                    Text('${widget.restaurant.rating}'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                    const SizedBox(width: 8.0),
                    const Text('Add to Favorites'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ExpandableText(
              widget.restaurant.description,
              expandText: 'Read more',
              collapseText: 'Read less',
              maxLines: 4, // Set the number of lines to display initially
              linkColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
