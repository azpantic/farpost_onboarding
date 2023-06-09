import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobile_application_template/controllers/dialog_controller.dart';
import 'package:flutter_mobile_application_template/controllers/dialog_stepper_controller.dart';
import 'package:flutter_mobile_application_template/models/dialog.dart';
import 'package:flutter_mobile_application_template/widgets/dialog_page_widgets/message_widget.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DialogPage extends GetView<DialogController> {
  int? dialogIndex;

  DialogPage(String? param, {super.key}) {
    dialogIndex = int.parse(param ?? "0");
  }

  @override
  Widget build(BuildContext context) {
    // print(dialogIndex);
    return FutureBuilder<ChatDialog>(
      future: ChatDialog.getCurrentDialog(),
      builder: (context, AsyncSnapshot<ChatDialog> snapshot) {
        if (snapshot.hasData) {
          return dialogPage(context, snapshot.requireData);
        } else if (snapshot.hasError) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Error',
                ),
              ),
              body: Text(snapshot.error.toString()));
        } else {
          return const Scaffold(
            body: Center(child: Text('')),
          );
        }
      },
    );
  }

  Widget dialogPage(BuildContext context, ChatDialog dialog) {
    DialogController controller = DialogController(dialog);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(dialog.title),
          backgroundColor: Colors.transparent,
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.messageIndex.value,
                  itemBuilder: (BuildContext context, int index) {
                    return MessageWidget(msg: dialog.messages[index]);
                  },
                ),
              ),
              if (controller.messageIndex.value < dialog.messages.length &&
                  controller.showButton.value)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: controller.nextMessage,
                    child: Text(
                        dialog.messages[controller.messageIndex.value].text),
                  ),
                ),
              if (controller.dialogEnded.value)
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Диалог окончен', // TODO: текст в i18n
                    style: TextStyle(
                        color: Colors.white38), //TODO: брать цвет из темы
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
