import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:get/get.dart';

class CastomPage extends GetView<void> {
  const CastomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(/*t.navbar.castompage*/'Статистика'), //TODO: вернуть локализацию
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Как вы оцениваете сегодняшний день?', style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child:
                      Text("Отлично", style: TextStyle(color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child: Text("Хорошо", style: TextStyle(color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child:
                      Text("Нормально", style: TextStyle(color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child:
                      Text("Так себе", style: TextStyle(color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child: Text("Плохо", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
