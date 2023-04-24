import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/dialog.dart';
import '../models/dialog_info.dart';

class DialogStepperController extends GetxController {
  RxInt selectedDialogIndex = 0.obs;

  final allDialogData = [
    DialogInfo("Где я? Знакомство с компанией", "", true),
    DialogInfo("Приветствие", "", false),
    DialogInfo("Отпуск", "", false),
    DialogInfo("Зарплата", "", false),
    DialogInfo("Отпуск", "", false),
    DialogInfo("Отгулы", "", false),
    DialogInfo("Больничный", "", false),
    DialogInfo("Ресурсы для онлайн-обучения", "", false),
    DialogInfo("Наши сервисы", "", false),
  ].obs;

  void seteDialogEnable(int dialogIndex) {
    if (dialogIndex < 0 || dialogIndex > allDialogData().length - 1) return;
    allDialogData()[dialogIndex].isAvailable = true;
  }

  bool isDialogStepAvalible(int dialogIndex) {
    if (dialogIndex < 0 || dialogIndex > allDialogData().length - 1)
      return false;
    return allDialogData()[dialogIndex].isAvailable;
  }
}
