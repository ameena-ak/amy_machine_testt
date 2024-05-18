import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../const/colors_const.dart';
import '../data/firestor.dart';
import '../model/notes_model.dart';
import '../widgets/todo_listt.dart';
import 'add_todo_screen.dart';


class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    var myTextStyle = TextStyle(fontSize:30,fontWeight: FontWeight.bold , );
    var myTitleTextStyle = TextStyle(fontSize:25,fontWeight: FontWeight.bold , color: Colors.white);

    return Scaffold(
      backgroundColor: backgroundColors,

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text("WELCOME  🙏",
        style: myTitleTextStyle,
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout,color: Colors.white),
            onPressed: () {
              _logout();
            },
          ),
        ],
        backgroundColor: app_primary_color,

      ),
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
            ));
          },
          backgroundColor: app_primary_color,
          child: Text("✍️",
          style: myTextStyle,

          )//Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              TodoList(false),
            ],
          ),
        ),
      ),
    );
  }

  // Logout function
  void _logout() async {
    try {
      await _auth.signOut();
      // Redirect to login or another page after successful logout if needed
    } catch (e) {
      print("Error logging out: $e");
    }
  }
}
