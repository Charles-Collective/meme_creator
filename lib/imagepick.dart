import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'globals.dart' as global;

import 'imageedit.dart';

class ImagePick extends StatefulWidget {

  int numOfPics;

  ImagePick(this.numOfPics);

  @override
  _ImagePickState createState() => _ImagePickState(2);
}

class _ImagePickState extends State<ImagePick> {

  int numOfPics;

  _ImagePickState(this.numOfPics);

  File _image;

  getImage(ImageSource source, BuildContext context) async {

    var picture = await ImagePicker.pickImage(source: source);

    numOfPics--;

    setState(() => _image = picture );

    global.image = _image;
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _image.path,
      //toolbarColor: Colors.yellowAccent,
      //toolbarWidgetColor: Colors.yellowAccent,
      //toolbarTitle: 'Crop your meme'
    );

    setState(() {
      _image = cropped ?? _image;
    });
  }

  void _clear() {
    setState(() => _image = null);
    global.image = null;
  }

  void _next() {
    Navigator.pop(context);
  }

  MaterialApp imagePickScreen(var height) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:height/2,left: 110),
              child: Row(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.center,
                    icon: Icon(Icons.photo_library, size: 50,),
                    onPressed:() {
                      getImage(ImageSource.gallery, context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                      child: IconButton(
                        icon: Icon(Icons.photo_camera, size:50,),
                        onPressed: () {
                          getImage(ImageSource.camera, context);
                        },
                      ),
                    ),
              ],
                  ),
            ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    if(_image != null){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Edit(numOfPics)
        ),
      );
    }

    return imagePickScreen(height);

  }
}
