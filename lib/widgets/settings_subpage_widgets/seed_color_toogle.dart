import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constants.dart';
import 'package:flutter_mobile_application_template/controllers/main_controller.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:get/get.dart';

class SeedColorToogle extends GetView<MainController> {
  const SeedColorToogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 5 / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 1,
                        child: InkResponse(
                          // containedInkWell: true,
                          radius: 0,
                          onTap: () {
                            controller.isStaticColor(false);
                          },
                          child: Obx(
                            () => Card(
                              color: (!controller.isStaticColor()
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.background),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(appRoundRadius),
                              ),
                              child: Icon(
                                Icons.color_lens,
                                color: !controller.isStaticColor()
                                    ? context.theme.colorScheme.onPrimary
                                    : context.theme.colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(t.settings.dynamic_color),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 5 / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 1,
                        child: InkResponse(
                          radius: 0,
                          onTap: () {
                            controller.isStaticColor(true);
                          },
                          child: Obx(
                            () => Card(
                              color: (controller.isStaticColor()
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.background),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(appRoundRadius),
                              ),
                              child: Icon(
                                Icons.color_lens,
                                color: controller.isStaticColor()
                                    ? context.theme.colorScheme.onPrimary
                                    : context.theme.colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(t.settings.static_color),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (controller.isStaticColor())
            Padding(
              padding: const EdgeInsets.all(appPadding),
              child: Text(
                t.settings.static_color_picker,
              ),
            ),
          if (controller.isStaticColor())
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                staticColorAccent.length,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 2),
                    child: InkResponse(
                      onTap: () {
                        controller.colorSeed(
                          staticColorAccent[index],
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(appRoundRadius),
                          color: staticColorAccent[index],
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: (staticColorAccent[index] ==
                                  controller.colorSeed()
                              ? const Icon(Icons.check)
                              : null),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
