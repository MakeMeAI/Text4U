import 'package:flutter/material.dart';
import 'convoBubble.dart';
import 'conversationPage.dart';
import 'helper/UserContacts.dart';

class ContactList extends StatelessWidget {
  //dummy data till we have actual info from backendfinal

  //map of unique id's give us

// Initialize list of UserContacts with dummy data
  List<UserContacts> dummyContacts = [
    UserContacts('contact_id_1', 'Contact 1', pastMessages: [
      Message(true, 'Hello!'), // Example user message
      Message(false, 'Hi there!'), // Example contact message
      Message(true, 'How are you?'), // Example user message
    ]),
    UserContacts('contact_id_2', 'Contact 2', pastMessages: [
      Message(true, 'Hey!'), // Example user message
      Message(false, 'Hello!'), // Example contact message
    ]),
    UserContacts('contact_id_3', 'Contact 3', pastMessages: [
      Message(false, 'Hi!'), // Example contact message
      Message(true, 'Hi, Contact 3!'), // Example user message
    ]),
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
                contactName: dummyContacts[index].contactName,
                lastMessage: 'Hello, how are you?',
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context)=>chatDisplay(contact: dummyContacts[index].contactName, chatData: dummyContacts[index])));


                },
                // color: Colors.blue,
              );
            },
            childCount: dummyContacts.length,
          ),
        ),
      ],
    ),
    );
  }
}
