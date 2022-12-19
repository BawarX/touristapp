import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:touristapp/models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickerImage){
    final newPlace = Place(
      id: DateTime.now().toString(),
       title: pickedTitle,
        location: null,
         image: pickerImage
         );
         _items.add(newPlace);
         notifyListeners();
  }
}