import 'package:flutter/material.dart';
import 'package:touristapp/screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).pushNamed(AddPlaceScreen.routName);
        },
         icon: Icon(Icons.add))],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
