import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobile_application_template/controllers/dialog_comtroller.dart';
import 'package:flutter_mobile_application_template/models/dialog.dart';
import 'package:flutter_mobile_application_template/widgets/dialog_page_widgets/message_widget.dart';
import 'package:get/get.dart';

class DialogPage extends GetView<DialogController> {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    ChatDialog dialog = ChatDialog(
      // TODO: диалог должен как-то передаваться извне
      'Добро пожаловать',
      [
        Message('Привет, я софия', false),
        Message('Привет, чем занимаетесь', true),
        Message('Делаем мир лучше', false),
        Message('Круто', true),
        Message('Да', false),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(dialog.title),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: dialog.messages.length,
        itemBuilder: (BuildContext context, int index) {
          return MessageWidget(msg: dialog.messages[index]);
        },
      ),
    );
  }
}
