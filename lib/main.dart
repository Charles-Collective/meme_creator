import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MyHomePage());
}

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _image;

  getImage(ImageSource source, BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: source);

    _image = picture;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            new Text("\n\n\n\n\n\n\n\n\n\n\n"),
            new Text("Upload a photo to edit", style: TextStyle(fontSize: 28),),
            new Text("\n"),
            Row(
              children: <Widget>[ 
                new Text("                                  "),
                IconButton(
                  icon: Icon(Icons.photo_library, size: 50,),
                  onPressed:() {
                    getImage(ImageSource.gallery, context);
                  }
                ),
                new Text("          "),
                IconButton(
                  icon: Icon(Icons.photo_camera, size: 50),
                  onPressed: () {
                    getImage(ImageSource.camera, context);
                  }
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if(_image != null) ...{
            Image.file(_image, width: 400, height: 400,),
            Row(
              children: <Widget>[
                FlatButton(
                  child:Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),
          }
        ],
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage(ImageSource.gallery, context),
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }*/

}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return _ImageCaptureState().build(context);
  }
}
