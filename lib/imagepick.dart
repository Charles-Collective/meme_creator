import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.only(top:400.0,left: 110),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.center,
                        icon: Icon(Icons.photo_library, size: 50,),
                        onPressed:() {
                          getImage(ImageSource.gallery, context);
                        }
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: IconButton(
                          icon: Icon(Icons.photo_camera, size: 50),
                          onPressed: () {
                            getImage(ImageSource.camera, context);
                          }
                      ),
                    ),
                  ],
                ),
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


class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {

  @override
  Widget build(BuildContext context) {
    return _ImageCaptureState().build(context);
  }
}
