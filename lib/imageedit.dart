import 'package:charlesmemeeditor/util/hexcolor.dart';
import 'package:charlesmemeeditor/imagepick.dart';
import 'package:charlesmemeeditor/imageedit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as global;

class Edit extends StatefulWidget {
  @override
  _EditState createState() =>   _EditState();

}


class  _EditState extends State<Edit> {
  Widget build(BuildContext context) {
  return MaterialApp(
  home: Scaffold(
  body: ListView(
  //  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Image.file(global.image, width: 500, height: 500,alignment: Alignment.center,),
    ),
    Center(child:
    Row(
    children: <Widget>[
    Expanded(
    child: IconButton(
    alignment: Alignment.bottomCenter,
    icon: Icon(Icons.crop),
   // onPressed: _cropImage,
    ),
    ),
    Expanded(
    child: IconButton(
    alignment: Alignment.bottomCenter,
    icon: Icon(Icons.refresh),
   // onPressed: _clear,
    ),
    ),
    Expanded(
    child: IconButton(
    alignment: Alignment.bottomCenter,
    icon: Icon(Icons.check, color: Colors.black,),
   // onPressed: _next, //to be changed to move on to next screen/ take next photo
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
}
