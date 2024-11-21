import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning_flutter_b/modules/restaurant/entities/restaurant.dart';

class CustomListRestaurants extends StatelessWidget {
  const CustomListRestaurants({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          restaurant.images[0],
          width: 60,
          height: 60,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style:
                  const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 200,
                height: 32,
                child: Text(restaurant.description,
                    style: const TextStyle(
                        fontSize: 12.0, color: Colors.black54))),
          ],
        ),
        const Spacer(),
        StarRating(
          rating: restaurant.rating / restaurant.count,
          color: Colors.orange[200],
          borderColor: Colors.grey,
          starCount: 5,
          size: 12,
        ),
      ],
    );
  }
}
