import 'package:flutter/material.dart';
import '../const/colors_const.dart';
import '../data/firestor.dart';
import '../model/notes_model.dart';
import '../screen/edit_todo_screen.dart';

class TodoItem_Widget extends StatefulWidget {
  Note _note;
  TodoItem_Widget(this._note, {super.key});

  @override
  State<TodoItem_Widget> createState() => _TodoItem_WidgetState();
}

class _TodoItem_WidgetState extends State<TodoItem_Widget> {
  @override
  Widget build(BuildContext context) {
    bool isDone = widget._note.isDon;

    var myHeight = MediaQuery.of(context).size.height;
    var myWidth =  MediaQuery.of(context).size.width;
    var myEmojiStyle = TextStyle(fontSize:100 );
    var mySizeBox = SizedBox(height: 20);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: myHeight/5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [

              SizedBox(width: 25),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                       Text("➡️  "),
                        Text(
                          widget._note.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Checkbox(
                        //   activeColor: app_primary_color,
                        //   value: isDone,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       isDone = !isDone;
                        //     });
                        //     Firestore_Datasource()
                        //         .isdone(widget._note.id, isDone);
                        //   },
                        // )
                      ],
                    ),
                    Text(
                      widget._note.subtitle,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),

                    Container(
                        alignment: Alignment.bottomCenter,
                        child: edit_time())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget edit_time() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child:

      Row(
        children: [
          Container(
            width: 100,
            height: 38,
            child: Row(
              children: [
                Text("🕰️",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Image.asset('images/icon_time.png'),
                SizedBox(width: 10),
                Text(
                  widget._note.time,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Edit_Screen(widget._note),
              ));
            },
            child: Container(
              width: 90,
              height: 28,
              decoration: BoxDecoration(
                color: backgroundColors,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageee() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/${widget._note.image}.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
