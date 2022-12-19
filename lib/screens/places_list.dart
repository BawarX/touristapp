import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/provider/great_places.dart';
import 'package:touristapp/screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yourrr places"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: Center(
            child: Text('got no places, add some'),
          ),
          builder: (context, great_places, ch) => great_places.items.length <= 0
              ? ch!
              : ListView.builder(
                  itemBuilder: (context, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(great_places.items[i].image),
                    ),
                    title: Text(great_places.items[i].title.toString()),
                    onTap: (){},
                  ),
                  itemCount: great_places.items.length,
                ),
        ));
  }
}
