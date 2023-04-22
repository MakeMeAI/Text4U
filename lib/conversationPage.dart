import 'package:flutter/material.dart';

class ChatDisplay extends StatelessWidget {
  final List<List<String>> chatData;

  const ChatDisplay({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Display'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

  const ChatMessage({super.key, required this.sender, required this.messageText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
          const SizedBox(height: 5.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
              messageText,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
