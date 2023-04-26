import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

class DictionaryInfo {
  DictionaryInfo(this.title, this.content);

  final title;
  final content;

  static const int infoAmount = 11;

  static DictionaryInfo currentInfo = DictionaryInfo('', '');

  static DictionaryInfo getCurrentInfo() {
    return currentInfo;
  }

  static void setCurrentInfo(DictionaryInfo info) {
    currentInfo = info;
  }

  static Future<DictionaryInfo> fromFile(String filePath) async {
    String json = await rootBundle.loadString(filePath);
    DictionaryInfo info = DictionaryInfo('', '');
    try {
      Map<String, dynamic> dialogJsonMap = jsonDecode(json);
      info = DictionaryInfo.fromJson(dialogJsonMap);
    } catch (e) {
      developer.log('Error at "$filePath": ${e.toString()}');
      info = DictionaryInfo('Ошибка', 'Невозможжно открыть');
    }
    return info;
  }

  static Future<List<DictionaryInfo>> getInfo() async {
    List<DictionaryInfo> list = <DictionaryInfo>[];

    for (int i = 0; i < infoAmount; i++) {
      String json = await rootBundle.loadString('assets/dictionary/$i.json');
      try {
        Map<String, dynamic> dialogJsonMap = jsonDecode(json);
        DictionaryInfo info = DictionaryInfo.fromJson(dialogJsonMap);
        list.add(info);
      } catch (e) {
        developer.log('Error at "$i.json": ${e.toString()}');
      }
    }
    return list;
  }

  factory DictionaryInfo.fromJson(Map<String, dynamic> json) {
    return DictionaryInfo(
      json['title'] ?? '',
      json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isMine': content,
    };
  }
}
