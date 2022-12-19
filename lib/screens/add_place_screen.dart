import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/provider/great_places.dart';
import 'package:touristapp/widget/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routName = '/add-place';
  AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  late File _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return; // here you can add show error dialog...
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.toString(), _pickedImage);
        Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInputWidget(_selectImage),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add place'),
            onPressed: _savePlace,
            // remove bracket's so that we can tell flutter:
            // 'hey flutter kura!! yaksar rune maka, kayne user buttone dagrt'
            // awkat eshe xot bka. . .
            // awanay xware hamue datane zyad bkay bas ofcourse watch your version, some might be depricated...
            // elevation:0,
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
            //color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
