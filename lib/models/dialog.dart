import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class ChatDialog {
  String title = '';
  List<Message> messages = [];

  static int dialogIndex = 0;

  ChatDialog({required this.title, required this.messages});

  static Future<ChatDialog> getCurrentDialog() async {
    String json = await rootBundle.loadString('assets/dialogs/$dialogIndex.json');
    Map<String, dynamic> dialogJsonMap = jsonDecode(json);
    ChatDialog dialog = ChatDialog.fromJson(dialogJsonMap);
    return dialog;
  }

  static Future<ChatDialog> getDialog(int id) async {
    dialogIndex = id;
    return await getCurrentDialog();
  }

  factory ChatDialog.fromJson(Map<String, dynamic> json) {
    return ChatDialog(
      title: json['title'] ?? '',
      messages: (json['messages'] as List<dynamic>)
          .map((messageJson) => Message.fromJson(messageJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }
}

class Message {
  String text;
  bool isMine;

  Message(this.text, this.isMine);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      json['text'] ?? '',
      json['isMine'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isMine': isMine,
    };
  }
}
