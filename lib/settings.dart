import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.2),
      body: Center (
        child: Container (
            decoration: BoxDecoration(
                border: Border.all( width: 1, color: Colors.transparent),
                borderRadius: const BorderRadius.all(const Radius.circular(40)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple.shade500,
                    Colors.deepPurpleAccent.shade100,
                  ],
                )
            ),
          child: Center(
            child: Hero(
              tag: 'title-Settings' ,
              child: Material(
                type: MaterialType.transparency,
                child: Text('Settings', style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 20.0
                ),),
              ),
            ), //child: Text('Very legit settings page'),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class CustomListTile extends StatelessWidget{

  IconData icon;
  String text;
  VoidCallback onTap;
  String on;
  String off;
  String extra;

  CustomListTile(this.icon,this.text,this.onTap,this.on,this.off,this.extra);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 6.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white54.withOpacity(0.4)))
        ),
        child: InkWell(
          splashColor: Colors.purpleAccent.shade100,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon, color:Colors.white70.withOpacity(0.7)),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(text, style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20.0
                        ),),
                      ),
                    ),
// Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                    ToggleSwitch(
                      initialLabelIndex: 0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 3,
                      icons: [
                        Icons.keyboard_arrow_left,
                        Icons.arrow_upward,
                        Icons.keyboard_arrow_right
                      ],
                      borderColor: [Color(0xff3b5998), Color(0xff8b9dc3), Color(0xff00aeff), Color(0xff0077f2), Color(0xff962fbf), Color(0xff4f5bd5)],
                      dividerColor: Colors.blueGrey,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],

                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}


