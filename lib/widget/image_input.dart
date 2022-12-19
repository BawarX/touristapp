import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageInputWidget extends StatefulWidget {
  
  late final Function onSelectImage;
  ImageInputWidget(this.onSelectImage);
  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
   File? _storedImage;

  Future<void>  _takePicture()async{
    final picker = ImagePicker();
      final fileImage = await picker.getImage( source: ImageSource.camera,maxWidth: 600);
    setState((){
      _storedImage = File(fileImage!.path);
    });
    final appDirection = await getApplicationDocumentsDirectory();
    final fileName = basename(fileImage!.path);
   final savedImage = await File(fileImage.path).copy('${appDirection.path}/$fileName');
   widget.onSelectImage(savedImage);
    }


  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        child: _storedImage != null
            ? Image.file(
                _storedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Text('no image selected',textAlign: TextAlign.center,),
        alignment: Alignment.center,
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        // so the widget inside can take all the spaces that needs
        child: ElevatedButton.icon(
          icon: Icon(Icons.camera),
          onPressed: _takePicture,
          label: Text("Take Picture"),
        ),
      ),
    ]);
  }
}
