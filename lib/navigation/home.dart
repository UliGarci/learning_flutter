import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter_b/modules/restaurant/entities/restaurant.dart';
import 'package:learning_flutter_b/modules/restaurant/widgets/custom_list_restaurants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  bool _isLoading = true;
  List<Restaurant> restaurants = [];
  @override
  void initState() {
    super.initState();
    db.collection("restaurants").snapshots().listen((event) {
      restaurants.clear();
      for (var doc in event.docs) {
        final restaurant = Restaurant(
            doc.data()['name'],
            doc.data()['description'],
            List<String>.from(doc.data()['images']),
            doc.data()['rating'],
            doc.data()['count']);
        restaurants.add(restaurant);
      }
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: restaurants.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return CustomListRestaurants(restaurant: restaurants[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/top'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
