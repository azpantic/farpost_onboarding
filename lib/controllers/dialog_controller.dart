import 'package:flutter_mobile_application_template/models/dialog.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  DialogController(this.dialog) {
    receiveMessages();
  }

  final allChatData = [
    ChatDialog(
      title: "Добро пожаловать",
      messages: [
        Message("Привет", false),
        Message("Привет", true),
        Message("Этот диалог - первое знакомство", false),
        Message("Круто", true),
        Message("В следующих диалогах мы расскажем больше", false),
      ],
    ),
    ChatDialog(
      title: "Продолжаем знакомиться",
      messages: [
        Message("Вы уже знаете кое-что, но мы расскажем еще", false),
        Message("Я заинтересован", true),
        Message("*Дополительная информация*", false),
      ],
    ),
    ChatDialog(
      title: "Продвинутое знакомство",
      messages: [
        Message("Вы знаете уже почти все", false),
        Message("Да, но мне интересно больше", true),
        Message("Узнайте больше из наших ресурсов", false),
      ],
    ),
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
