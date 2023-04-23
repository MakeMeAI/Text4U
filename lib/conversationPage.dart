import 'package:flutter/material.dart';
import 'helper/UserContacts.dart';

class chatDisplay extends StatefulWidget {
  final UserContacts chatData;
  //name of contact
  final String contact;
  chatDisplay({required this.contact, required this.chatData});

  @override
  chatDisplayState createState() => chatDisplayState();



}

@override
class chatDisplayState extends State<chatDisplay> {
  //messages with user, true if sent by user false if sent by contact


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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.chatData.pastMessages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatMessage(
                        sender: widget.chatData.pastMessages[index].isMe ? "User" : widget.contact,
                        messageText: widget.chatData.pastMessages[index].messageContent,
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            // Do something with the typed value
                          },
                          onSubmitted: (value) {
                            widget.chatData.addMessage(true, value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Add the typed message to the chat
                          // chatData.addMessage(true, value);
                        },
                      ),
                    ],
                  ),
                ),
              ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addMessage(bool sender, String messageText) {
    setState(() {
      widget.chatData.addMessage(sender, messageText);
    });
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