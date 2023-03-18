
import 'package:flutter/material.dart';

import 'convoBubble.dart';

class ContactList extends StatelessWidget {
  //dummy data till we have actual info from backend
  final List<String> contacts = [
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
    'Alice Williams',
    'Tom Davis',
    'Samantha Lee',
    'Mark Wilson',
    'Karen Brown',
    'Mike Clark',
    'Mary Johnson',
    'David Green',
    'Emily Davis',
    'Chris Lee',
    'Anna Taylor',
    'Richard White',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Welcome back, NAME"),
          backgroundColor: Color(0x4400000000),
          elevation: 0,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return ContactBox(
                contactName: contacts[index],
                lastMessage: 'Hello, how are you?',
                onPressed: () {
                  print('Pressed ${contacts[index]}');
                },
                // color: Colors.blue,
              );
            },
            childCount: contacts.length,
          ),
        ),
      ],
    ),
    );
  }
}
