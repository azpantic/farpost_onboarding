class ChatDialog {
  String title = '';
  int messageIndex = 1;
  List<Message> messages = [];

  ChatDialog(this.title, this.messages);

  List<Message> getMessagesList(){
    return messages.sublist(0, messageIndex);
  }
}

class Message{
  String text;
  bool isMine;

  Message(this.text, this.isMine);
}