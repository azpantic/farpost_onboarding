import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobile_application_template/constans.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:get/get.dart';

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
    return Stepper(
      controlsBuilder: ((context, details) {
        return Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Прочитать")),
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
        Step(
          title: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(appRoundRadius),
              ),
              padding: EdgeInsets.all(appPadding),
              child: const Text('Первая неделя')),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Знакомоство с компанпей и её итстоией')),
        ),
        Step(
          title: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(appRoundRadius),
              ),
              padding: EdgeInsets.all(appPadding),
              child: const Text('Первая неделя')),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Знакомоство с компанпей и её итстоией')),
        ),
        Step(
          title: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(appRoundRadius),
              ),
              padding: EdgeInsets.all(appPadding),
              child: const Text('Первая неделя')),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Знакомоство с компанпей и её итстоией')),
        ),
        Step(
          title: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(appRoundRadius),
              ),
              padding: EdgeInsets.all(appPadding),
              child: const Text('Первая неделя')),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Знакомоство с компанпей и её итстоией')),
        ),
        Step(
          title: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(appRoundRadius),
              ),
              padding: EdgeInsets.all(appPadding),
              child: const Text('Первая неделя')),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Знакомоство с компанпей и её итстоией')),
        ),
      ],
    );
  }
}
