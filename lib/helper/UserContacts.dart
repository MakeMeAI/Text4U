class Message {
  //isMe is true if the sender of the message is the user and false if it is the contact
  bool isMe;
  String messageContent;
  //might want to add ability to store longer messages into multiple nodes later
  Message(this.isMe, this.messageContent);
}

class UserContacts {
  //ID set at creation and cannot be changed
  String contactID;
  //contact name can be changed later
  String contactName;
  String lastMessage;
  List<Message> pastMessages;
  // String profilePicture;
  //might want to add profilePicture population
  // Constructor
  UserContacts(this.contactID, this.contactName, this.lastMessage, {this.pastMessages = const[]});

  // Getter methods
  String getName() {
    return contactName;
  }

  String getID() {
    return contactID;
  }
  // Setter methods
  void setName(String newName) {
    contactName = newName;
  }

  void addMessage(bool sentByMe, String content){
    pastMessages.add(Message(sentByMe, content));
    lastMessage = content;
  }
}
