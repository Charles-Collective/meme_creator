import 'dart:ui';
import 'dart:async';
import 'dart:io';
import 'package:charlesmemeeditor/util/hexcolor.dart';
import 'package:charlesmemeeditor/imagepick.dart';
import 'package:charlesmemeeditor/imageedit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_cropper/image_cropper.dart';
import 'globals.dart' as global;
import 'imagepick.dart';
import 'template.dart';
import 'package:image_editor_pro/image_editor_pro.dart';


class Edit extends StatefulWidget {

  int numOfPics;

  Edit(this.numOfPics);

  @override
  _EditState createState() =>   _EditState(numOfPics);
}

enum AppState {
  free,
  picked,
  cropped,
}

class  _EditState extends State<Edit> {
  AppState state;

  int numOfPics;

  _EditState(this.numOfPics);

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: height/20),
              child: Image.file(global.image, width: width, height: height/1.5, alignment: Alignment.center,),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end ,
                children: <Widget>[
                  Expanded(
                    child: IconButton( //crop button
                      padding: EdgeInsets.only(top: height/10),
                      alignment: FractionalOffset.bottomCenter,
                      icon: Icon(Icons.crop, color: Colors.black),
                      onPressed: _cropImage,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.only(top: height/10),
                      alignment: FractionalOffset.bottomCenter,
                      icon: Icon(Icons.text_fields, color: Colors.black),
                      onPressed: getimageditor,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.only(top: height/10),
                      alignment: FractionalOffset.bottomCenter,
                      icon: Icon(Icons.check, color: Colors.black,),
                      onPressed: _next, //to be changed to move on to next screen/ take next photo
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: global.image.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop your meme',
            toolbarColor: Colors.grey,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      global.image = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }

  Future<void> getimageditor()  {
    final geteditimage =   Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return ImageEditorPro(
            appBarColor: Colors.blue,
            bottomBarColor: Colors.blue,
          );
        }
    )).then((geteditimage){
      if(geteditimage != null){
        setState(() {
          global.image =  geteditimage;
        });
      }
    }).catchError((er){print(er);});

  }

  void _next() {

    numOfPics--;

    if(numOfPics == 0){
      //TODO move on to new page, combine images or whatever, but for now: return to template page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Template()
        ),
      );
    } else {
      Navigator.pop(context);
      //TODO, cannot understand the !_debugLocked assertion failure, found code on the flutter.dev site that appears
      //TODO  to be the exact same setup of what we have here: imagepick pushes edit, edit pops and hence should go
      //TODO  back to image pick. https://flutter.dev/docs/cookbook/navigation/navigation-basics.Cannot find the answer
      //TODO  online for the life of me, needs a fresh set of eyes. <3 ~Seán.
    }
  }

  void _clearImage() {
    global.image = null;
    setState(() {
      state = AppState.free;
    });
  }
}