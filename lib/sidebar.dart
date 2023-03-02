import 'package:flutter/material.dart';

class sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all( width: 1, color: Colors.transparent),
            borderRadius: const BorderRadius.all(const Radius.circular(40)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.deepPurpleAccent,
              ],
            )
        ),
      child: ListView(
        children:[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white70.withOpacity(0.2),
              ),
              accountName: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('User1', style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ),
              accountEmail: Text('User1@gmail.com', style: TextStyle(color: Colors.white, fontSize: 15.0)),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                ),
              ),
          ),
          CustomListTile(Icons.favorite,'Favorites', (){Navigator.pop(context);}),
          CustomListTile(Icons.verified_user,'Profile', ()=>{}),
          CustomListTile(Icons.settings,'Settings', ()=>{})
        ],
      ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon,this.text,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 6.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white54.withOpacity(0.4)))
        ),
        child: InkWell(
          splashColor: Colors.pinkAccent,
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          }, //onTap, Doesnt work?
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
                      child: Text(text, style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20.0
                      ),),
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