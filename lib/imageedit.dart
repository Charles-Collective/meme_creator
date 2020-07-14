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
                      icon: Icon(Icons.crop),
                      //onPressed: _cropImage,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.only(top: height/10),
                      alignment: FractionalOffset.bottomCenter,
                      icon: Icon(Icons.refresh),
                      //onPressed: _clear,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.only(top: height/10),
                      alignment: FractionalOffset.bottomCenter,
                      icon: Icon(Icons.check, color: Colors.black,),
                      //onPressed: _next, //to be changed to move on to next screen/ take next photo
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
