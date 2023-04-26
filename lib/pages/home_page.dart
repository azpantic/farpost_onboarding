import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constants.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:flutter_mobile_application_template/models/dialog_info.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/dialog_stepper_controller.dart';
import '../models/dialog.dart';

class HomePage extends GetView<void> {
  HomePage({super.key});

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


  final urls = [
    'https://forms.gle/w3YLVUqNYqidBHXZ9',
    'https://forms.gle/ikTWMe8AJ8UFtGJq8',
    'https://forms.gle/T8XCNARxtS9YMQ55A',
    'https://forms.gle/NFrx3GhmBvnLUaHCA',
    'https://forms.gle/mPd1ZVUsvfLdx8JY8',
    'https://forms.gle/mPd1ZVUsvfLdx8JY8',
    'https://forms.gle/tpHySMFef74MD6Dn6',
    'https://forms.gle/1ktwUZ27eJnL7W9P9',
    'https://forms.gle/y7EhR6whGNSbdRx2A',
    'https://forms.gle/zwyzS34XPBbzhjgh8'
  ];

  Future<void> openUrl(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child: const Text(
                    "Прочитать",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      openUrl(urls[details.currentStep]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    child: const Text(
                      "Пройти тест",
                      style: TextStyle(color: Colors.white),
                    )),
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
            msg: "Этот диалог пока недоступен",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.black,
            fontSize: 16,
            backgroundColor: Colors.grey[200],
          );
        },
        steps: controller.allDialogData
            .map(
              (dialogInfo) => Step(
                isActive: dialogInfo.isAvailable,
                title: Container(
                  decoration: BoxDecoration(
                    color: dialogInfo.isAvailable
                        ? availableChatColor
                        : unavailableChatColor,
                    borderRadius: BorderRadius.circular(appRoundRadius),
                  ),
                  padding: EdgeInsets.all(appPadding),
                  child: Text(
                    dialogInfo.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                content: dialogInfo.subTitle != ''
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: Text(dialogInfo.subTitle),
                      )
                    : SizedBox(height: 1),
              ),
            )
            .toList(),
      ),
    );
  }
}
