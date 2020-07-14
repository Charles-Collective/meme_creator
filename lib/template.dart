import 'package:charlesmemeeditor/util/hexcolor.dart';
import 'package:charlesmemeeditor/imagepick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  @override
  _TemplateState createState() =>  _TemplateState();

}

class _TemplateState extends State<Template> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: GridView.count(
            padding: EdgeInsets.all(20.0),
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: <Widget>[
              GestureDetector(
                child: Container(child: Image.network("http://exchangedownloads.smarttech.com/public/content/86/8646d665-ae5f-46b7-b6ae-4c50368ed350/previews/small/0001.png", fit: BoxFit.cover)),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePick(2))
                  );
                },
              ),
              GestureDetector(
                child: Container(child: Image.network("http://exchangedownloads.smarttech.com/public/content/86/8646d665-ae5f-46b7-b6ae-4c50368ed350/previews/small/0001.png", fit: BoxFit.cover)),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePick(2))
                  );
                },
              ),
              GestureDetector(
                child: Container(child: Image.network("http://exchangedownloads.smarttech.com/public/content/86/8646d665-ae5f-46b7-b6ae-4c50368ed350/previews/small/0001.png", fit: BoxFit.cover)),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePick(2))
                  );
                },
              ),
              GestureDetector(
                child: Container(child: Image.network("http://exchangedownloads.smarttech.com/public/content/86/8646d665-ae5f-46b7-b6ae-4c50368ed350/previews/small/0001.png", fit: BoxFit.cover)),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePick(2))
                  );
                },
              ),
              GestureDetector(
                child: Container(child: Image.network("http://exchangedownloads.smarttech.com/public/content/86/8646d665-ae5f-46b7-b6ae-4c50368ed350/previews/small/0001.png", fit: BoxFit.cover)),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePick(2))
                  );
                },
              ),
              GestureDetector(
                child: Container(child: Image.network("http://exchangedownloads.smarttech.com/public/content/86/8646d665-ae5f-46b7-b6ae-4c50368ed350/previews/small/0001.png", fit: BoxFit.cover)),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePick(2))
                  );
                },
              ),
            ],

          ),
        ),
      ),
    );
  }
}

