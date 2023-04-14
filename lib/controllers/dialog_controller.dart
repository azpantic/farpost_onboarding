import 'package:flutter_mobile_application_template/models/dialog.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  DialogController(this.dialog) {
    receiveMessages();
  }

  final ChatDialog dialog;
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
    }
    else{
      dialogEnded.value = true;
    }
  }

  Future<void> nextMessage() async {
    messageIndex.value++;
    receiveMessages();
  }
}
