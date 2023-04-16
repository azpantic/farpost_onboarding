import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/dialog_info.dart';

class DialogStepperController extends GetxController {
  RxInt selectedDialogIndex = 0.obs;

  final allDialogData = [
    DialogInfo("Добро пожаловать", "Сегодня вы познакомитесь с Farpost", true),
    DialogInfo("Продолжайте изучать", "Вы уже знаете про Farpost", false),
    DialogInfo(
        "Вы знаете почти все", "Вы полноценный сотрудник Farpost", false),
  ].obs;

  bool isDialogStepAvalible(int dialogIndex) {
    if (dialogIndex < 0 || dialogIndex > allDialogData().length - 1)
      return false;
    return allDialogData()[dialogIndex].isAvailable;
  }
}
