import 'package:flutter_mobile_application_template/constans.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt page = 0.obs;

  RxBool isDarkMode = true.obs;
  RxBool isSystemTheme = false.obs;

  RxBool isStaticColor = true.obs;

  var colorSeed = appColor.obs;

  // var themeMode = ThemeMode.system.obs;
}
