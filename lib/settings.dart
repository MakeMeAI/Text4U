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
          child: ListView(
            children: [
              Hero(
                tag: 'title-Settings' ,
                child: Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: Text('Settings', style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 30.0
                      ),),
                  ),
                ),
              ),
              CustomListTile(Icons.saved_search,'Text Size', 'Default', 'Large', ()=>{Navigator.pop(context)}),
              CustomListTile(Icons.text_fields,'Dyslexia Font', 'Default', 'Dyslexia',
                      ()=>{Navigator.pop(context)})
            ],
             //child: Text('Very legit settings page'),
          ),

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
  String on;
  String off;
  VoidCallback onTap;

  CustomListTile(this.icon,this.text,this.on,this.off,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 6.0),
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border(bottom: BorderSide(color: Colors.white54.withOpacity(0.4)))
        // ),
        child: InkWell(
          splashColor: Colors.purpleAccent.shade100,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                  ],
                ),
                ToggleSwitch(
                  minWidth: 60.0,
                  minHeight: 25.0,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,

                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.purple.shade400,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels:["OFF","ON"],
                  // borderColor: [Color(0xff773b98), Color(0xffbf63d9), Color(0xff724cc4), Color(0xff962fbf), Color(0xffbf63d9)],
                  borderColor: [Color(0xff9545c0), Colors.purpleAccent],
                  dividerColor: Colors.white38,
                  activeBgColor:  [Colors.purpleAccent.shade100],
                  onToggle: (index) {
                    //What switch does
                    print('switched to: $index');
                    onTap: onTap;
                  },
                )
              ],
        ),
            ),
          ),

        ),
      );
  }
}
