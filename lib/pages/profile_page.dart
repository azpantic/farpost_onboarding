import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobile_application_template/i18n/strings.g.dart';
import 'package:flutter_mobile_application_template/models/dictionary_info.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends GetView<void> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(t.navbar.profile),
            IconButton(
              onPressed: () {
                context.push("/profile/settings");
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<DictionaryInfo>>(
        future: DictionaryInfo.getInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return InfoList(snapshot.requireData);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget InfoList(List<DictionaryInfo> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.deepOrange,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(list[index].title),
                  ElevatedButton(
                    onPressed: () {
                      DictionaryInfo.setCurrentInfo(list[index]);
                      context.push('/profile/info');
                    },
                    child: const Text('Открыть'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
