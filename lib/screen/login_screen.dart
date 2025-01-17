import 'package:flutter/material.dart';

import '../const/colors_const.dart';
import '../data/authentication_data.dart';


class LogIN_Screen extends StatefulWidget {
  final VoidCallback show;
  LogIN_Screen(this.show, {super.key});

  @override
  State<LogIN_Screen> createState() => _LogIN_ScreenState();
}

class _LogIN_ScreenState extends State<LogIN_Screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    super.initState();
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {


    var myHeight = MediaQuery.of(context).size.height;
    var myWidth =  MediaQuery.of(context).size.width;
    var myEmojiStyle = TextStyle(fontSize:100 );
    var mySizeBox = SizedBox(height: 20);
    return Scaffold(
      backgroundColor: backgroundColors,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              mySizeBox,
              mySizeBox,
              mySizeBox,
              Text("🙋", style: myEmojiStyle,),
              SizedBox(height: 50),
              textfield(email, _focusNode1, 'Enter Email', Icons.email),
              mySizeBox,
              mySizeBox,
              textfield(password, _focusNode2, 'Enter Password', Icons.remove_red_eye),
              SizedBox(height: 10),
              account(),
              mySizeBox,
              mySizeBox,
              Login_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              'Sign UP',
              style: TextStyle(
                  color: app_primary_color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget Login_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote().login(email.text, password.text,context);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: app_primary_color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'LogIn',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield(TextEditingController _controller, FocusNode _focusNode,
      String typeName, IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconss,
                color: _focusNode.hasFocus ? app_primary_color : Color(0xffc5c5c5),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: typeName,
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


}
