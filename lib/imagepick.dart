import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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

  void _next() {
    if(numOfPics==0) {
      //navigate to next page that displays the images selected
    } else {
      //navigate back to image picker page (camera/gallery)
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if(_image != null) ...{
              Image.file(_image, width: 400, height: 400,),
              Center(child:
                Row(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.center,
                      icon: Icon(Icons.crop),
                      onPressed: _cropImage,
                    ),
                    IconButton(
                      alignment: Alignment.center,
                      icon: Icon(Icons.refresh),
                      onPressed: _clear,
                    ),
                    IconButton(
                      alignment: Alignment.center,
                      icon: Icon(Icons.check, color: Colors.black,),
                      onPressed: _next, //to be changed to move on to next screen/ take next photo
                    )
                  ],
                ),

              )
              
            },
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
        /*bottomNavigationBar: BottomAppBar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.only(top:400.0,left: 110),
                child: Row(
                  children: <Widget>[
                    Text("HELLo"),
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
      */
      ),
    );
  }
}
