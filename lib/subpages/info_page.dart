import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/models/dictionary_info.dart';

class InfoPage extends StatelessWidget {
  final DictionaryInfo info;

  const InfoPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info.content),
      ),
    );
  }
}