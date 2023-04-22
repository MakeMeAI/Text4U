import 'package:flutter/material.dart';
import 'helper/UserContacts.dart';

class ChatDisplay extends StatelessWidget {
  //messages with user, true if sent by user false if sent by contact
  final List<Message> chatData;
  //name of contact
  String contact;

  ChatDisplay({required this.contact, required this.chatData});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.lightBlue,
                  Colors.blue,
                ],
              ),
            ),
            height: 80.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 16.0),
                Text(
                  //REPLACE THIS WITH PERSONS NAME
                  'Chat',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.purple,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: chatData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatMessage(

                      sender: chatData[index].isMe ? "User" : contact,
                      messageText: chatData[index].messageContent,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String messageText;

  ChatMessage({required this.sender, required this.messageText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            messageText,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}