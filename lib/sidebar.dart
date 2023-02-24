import 'package:flutter/material.dart';

class sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:[
          UserAccountsDrawerHeader(
              accountName: Text('User1'),
              accountEmail: Text('User1@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                ),
              ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}