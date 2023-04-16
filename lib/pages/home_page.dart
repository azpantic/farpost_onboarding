import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constants.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:flutter_mobile_application_template/models/dialog_info.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../controllers/dialog_stepper_controller.dart';
import '../models/dialog.dart';

class HomePage extends GetView<void> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.navbar.homepage),
      ),
      body: Center(
        child: Container(
          // height: context.mediaQueryShortestSide / 2,
          // color: context.theme.colorScheme.primary,
          child: DialogStepper(),
        ),
      ),
    );
  }
}

class DialogStepper extends GetView<DialogStepperController> {
  @override
  Widget build(BuildContext context) {
    return TitleStepper(context);
  }
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<DialogInfoProvider>(
  //     future: DialogInfoProvider.getDialogInfo(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData)
  //         return TitleStepper(context, snapshot.requireData);

  //       if (snapshot.hasError) return Text(snapshot.error.toString());

  //       return const Text('');
  //     },
  //   );

  Widget TitleStepper(BuildContext context) {
    return Obx(
      () => Stepper(
        controlsBuilder: ((context, details) {
          return Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ChatDialog.dialogIndex = details.currentStep;
                      context.goNamed("dialogPage",
                          params: {"dialogId": details.currentStep.toString()});
                      // context.push('/home/dialog', extra: {"dialogId": 1});
                    },
                    child: Text("Прочитать")),
                ElevatedButton(onPressed: () {}, child: Text("Пройти тест")),
              ],
            ),
          );
        }),
        currentStep: controller.selectedDialogIndex(),
        onStepTapped: (int dialogIndex) {
          if (controller.isDialogStepAvalible(dialogIndex)) {
            controller.selectedDialogIndex(dialogIndex);
            return;
          }

          Fluttertoast.showToast(
            msg: "This is a short message",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.black,
            fontSize: 16,
            backgroundColor: Colors.grey[200],
          );
        },
        steps: controller.allDialogData
            .map(
              (dialogInfo) => Step(
                title: Container(
                  decoration: BoxDecoration(
                    color: dialogInfo.isAvailable
                        ? availableChatColor
                        : unavailableChatColor,
                    borderRadius: BorderRadius.circular(appRoundRadius),
                  ),
                  padding: EdgeInsets.all(appPadding),
                  child: Text(dialogInfo.title),
                ),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(dialogInfo.subTitle),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
