class ChatDialog {
  String title = '';
  List<Message> messages = [];

  ChatDialog(this.title, this.messages);
  static int dialogIndex = 0;

  static ChatDialog getCurrentDialog(){
      // TODO: диалог должен вытягиваться из файла согласно индексу
    return ChatDialog(
      'Добро пожаловать',
      [
        Message('Привет, я софия', false),
        Message('Привет, чем занимаетесь', true),
        Message('Делаем мир лучше', false),
        Message('Круто', true),
        Message('Да', false),
      ],
    );
  }
}

class Message{
  String text;
  bool isMine;

  Message(this.text, this.isMine);
}