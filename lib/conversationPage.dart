import 'package:flutter/material.dart';


class ChatDisplay extends StatelessWidget {
  final List<List<String>> chatData;

  ChatDisplay({required this.chatData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Display'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatMessage(
                    sender: chatData[index][0],
                    messageText: chatData[index][1],
                  );
                },
              ),
            ),
          ],
        ),
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
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            messageText,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
