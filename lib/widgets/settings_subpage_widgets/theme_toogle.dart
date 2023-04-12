import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constans.dart';
import 'package:flutter_mobile_application_template/controllers/main_controller.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:get/get.dart';

class ThemeToggle extends GetView<MainController> {
  const ThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.isDarkMode(Get.isPlatformDarkMode);
                      controller.isSystemTheme(true);
                    },
                    child: Obx(
                      () => Card(
                        color: (controller.isSystemTheme()
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(appRoundRadius)),
                        child: Icon(
                          Icons.android,
                          color: controller.isSystemTheme()
                              ? context.theme.colorScheme.onPrimary
                              : context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(t.settings.system_theme)
              ],
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.isDarkMode(false);
                      controller.isSystemTheme(false);
                    },
                    child: Obx(
                      () => Card(
                        color: (!controller.isSystemTheme() &&
                                !controller.isDarkMode()
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(appRoundRadius)),
                        child: Icon(
                          Icons.sunny,
                          color: !controller.isSystemTheme() &&
                                  !controller.isDarkMode()
                              ? context.theme.colorScheme.onPrimary
                              : context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(t.settings.light_theme)
              ],
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.isDarkMode(true);
                      controller.isSystemTheme(false);
                    },
                    child: Obx(
                      () => Card(
                        color: (!controller.isSystemTheme() &&
                                controller.isDarkMode()
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(appRoundRadius)),
                        child: Icon(
                          Icons.dark_mode,
                          color: !controller.isSystemTheme() &&
                                  controller.isDarkMode()
                              ? context.theme.colorScheme.onPrimary
                              : context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(t.settings.dark_theme)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
