import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile_application_template/models/dialog.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  DialogController(this.dialog, this.scrollController) {
    receiveMessages();
  }

  final allChatData = [
    ChatDialog(title: "Добро пожаловать", messages: [
      Message("Привет", false),
    ]),
  ];

  void setActiveChat(int chatIndex) async {
    //dialog = allChatData[chatIndex];
    dialog = await ChatDialog.getDialog(chatIndex);
    currentChatIndex = chatIndex;
  }

  late void Function(int) onDialogEnd;

  late final currentChatIndex;

  ChatDialog dialog;
  RxInt messageIndex = 0.obs;
  RxBool showButton = true.obs;
  RxBool dialogEnded = false.obs;

  final delayMilliseconds = 500;
  final ScrollController scrollController;

  Future<void> receiveMessages() async {
    showButton.value = false;
    while (messageIndex.value < dialog.messages.length &&
        !dialog.messages[messageIndex.value].isMine) {
      await Future.delayed(Duration(milliseconds: delayMilliseconds));
      messageIndex.value++;
    }

    if (messageIndex.value < dialog.messages.length) {
      showButton.value = true;
    } else {
      dialogEnded.value = true;
      onDialogEnd(currentChatIndex);
    }
  }

  Future<void> nextMessage() async {
    messageIndex.value++;
    receiveMessages();
  }
}
