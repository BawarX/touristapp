import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/provider/great_places.dart';
import 'package:touristapp/screens/add_place_screen.dart';

import 'screens/places_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'great places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home:PlaceListScreen(),
        routes: {
          AddPlaceScreen.routName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}