import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const/colors_const.dart';
import '../data/firestor.dart';


class Add_creen extends StatefulWidget {
  const Add_creen({super.key});

  @override
  State<Add_creen> createState() => _Add_creenState();
}

class _Add_creenState extends State<Add_creen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;
  @override
  Widget build(BuildContext context) {

    var myHeight = MediaQuery.of(context).size.height;
    var myWidth =  MediaQuery.of(context).size.width;
    var myEmojiStyle = TextStyle(fontSize:100 );
    var mySizeBox = SizedBox(height: 20);
    var cancelTextStyle = TextStyle(fontSize:30,fontWeight: FontWeight.bold , color: Colors.white );


    return Scaffold(
      backgroundColor: backgroundColors,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ADD TODO"),
        backgroundColor: app_primary_color,
      ),
      body: SafeArea(
        child: Column(

          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
              child: Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(10),
                  child: Text('❎' , style: cancelTextStyle,)),
            ),
            mySizeBox,

            mySizeBox,

            Text("🤔", style: myEmojiStyle,),
            mySizeBox,
            mySizeBox,
            title_widgets(),
            mySizeBox,
            subtite_wedgite(),
            mySizeBox,
            button()
          ],
        ),
      ),
    );
  }

  Widget button() {

  var buttonTextStyle =  TextStyle(fontSize:18,fontWeight: FontWeight.bold , color: Colors.white );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [


        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
            Navigator.pop(context);
          },
          child: Text('Add' , style: buttonTextStyle,),
        ),



      ],
    );
  }



  Widget title_widgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: title,
        focusNode: _focusNode1,
        maxLength: 20,
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Enter title',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: app_primary_color,
                width: 2.0,
              ),
            )),
      ),
    );
  }

  Padding subtite_wedgite() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        maxLength: 70,
        maxLines: 3,
        controller: subtitle,
        focusNode: _focusNode2,
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: 'subtitle',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xffc5c5c5),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: app_primary_color,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
