import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/constants.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:flutter_mobile_application_template/models/dialog_info.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DialogInfoProvider>(
      future: DialogInfoProvider.getDialogInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TitleStepper(context, snapshot.requireData);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Text('');
        }
      },
    );
  }

  Widget TitleStepper(
      BuildContext context, DialogInfoProvider dialogInfoProvider) {
    return Stepper(
      controlsBuilder: ((context, details) {
        return Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ChatDialog.dialogIndex = details.currentStep;
                    context.push('/home/dialog');
                  },
                  child: Text("Прочитать")),
              ElevatedButton(onPressed: () {}, child: Text("Пройти тест")),
            ],
          ),
        );
      }),
      currentStep: _index,
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        for (int i = 0; i < dialogInfoProvider.data.length; i++)
          Step(
            title: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(appRoundRadius),
              ),
              padding: EdgeInsets.all(appPadding),
              child: Text(dialogInfoProvider.data[i].title),
            ),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Text(dialogInfoProvider.data[i].subTitle),
            ),
          )
      ],
    );
  }
}
