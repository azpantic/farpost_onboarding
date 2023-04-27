import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobile_application_template/controllers/state_controller.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:get/get.dart';

class CastomPage extends GetView<StateController> {
  const CastomPage({super.key});

  static const states = ['Отлично', 'Хорошо', 'Нормально', 'Так себе', 'Плохо'];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(StateController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
            /*t.navbar.castompage*/ 'Статистика'), //TODO: вернуть локализацию
      ),
      body: Obx(
        () => !controller.stateVoted()
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Column(
                          children: const [
                            Text(
                              'Ежедневный опрос',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              'Как вы оцениваете сегодняшний рабочий день?',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    for (int i = 0; i < states.length; i++)
                      StateButton(states[i]),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Спасибо за ответ',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () => controller.stateVoted(false),
                      child: const Text('Изменить ответ'),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget StateButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            controller.stateVoted(true);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
          ),
          child: Text(text, style: TextStyle(color: Colors.white))),
    );
  }
}
