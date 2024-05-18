import 'package:flutter/material.dart';

import '../const/colors_const.dart';
import '../data/firestor.dart';
import '../model/notes_model.dart';


class Edit_Screen extends StatefulWidget {
  Note _note;
  Edit_Screen(this._note, {super.key});

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  TextEditingController? title;
  TextEditingController? subtitle;

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController(text: widget._note.title);
    subtitle = TextEditingController(text: widget._note.subtitle);
  }

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
        title: Text("EDIT TODO"),
        backgroundColor: app_primary_color,
      ),
      body: SafeArea(
        child: Column(

          //mainAxisAlignment: MainAxisAlignment.center,
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

            Text("🫣", style: myEmojiStyle,),
            mySizeBox,
            mySizeBox,
            title_widgets(),
            mySizeBox,
            subtite_wedgite(),
            mySizeBox,mySizeBox,


            button()
          ],
        ),
      ),
    );
  }

  Widget button() {
    var buttonTextStyle = TextStyle(fontSize:18,fontWeight: FontWeight.bold , color: Colors.white );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            Firestore_Datasource().Update_Note(
                widget._note.id, indexx, title!.text, subtitle!.text);
            Navigator.pop(context);
          },
          child: Text('EDIT' , style: buttonTextStyle,),
        ),

      ],
    );
  }

  Container imagess() {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexx = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 7 : 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: indexx == index ? app_primary_color : Colors.grey,
                  ),
                ),
                width: 140,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset('images/${index}.png'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget title_widgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: 'title',
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
      ),
    );
  }

  Padding subtite_wedgite() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
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
      ),
    );
  }
}
