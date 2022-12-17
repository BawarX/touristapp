import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:touristapp/widget/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
 static const routName = '/add-place';
AddPlaceScreen({super.key});

  @override
  State<
AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
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
                    SizedBox(height: 10,),
                    ImageInputWidget(),
                  ],
                ),
              ),
            )
            ),
          ElevatedButton.icon(icon:Icon(Icons.add),
          label: Text('Add place'),
          onPressed: (){},
          // elevation:0,
          // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
          //color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}