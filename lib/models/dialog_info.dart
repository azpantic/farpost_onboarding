import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class DialogInfoProvider {
  List<DialogInfo> data = [];

  DialogInfoProvider({required this.data});

  static Future<DialogInfoProvider> getDialogInfo() async {
    String json = await rootBundle.loadString('dialogs/info.json');
    Map<String, dynamic> dialogJsonMap = jsonDecode(json);
    DialogInfoProvider dialog = DialogInfoProvider.fromJson(dialogJsonMap);
    return dialog;
  }

  factory DialogInfoProvider.fromJson(Map<String, dynamic> json) {
    return DialogInfoProvider(
      data: (json['data'] as List<dynamic>)
          .map((info) => DialogInfo.fromJson(info))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((info) => info.toJson()).toList(),
    };
  }
}

class DialogInfo {
  String title;
  String subTitle;

  bool isAvailable;

  DialogInfo(this.title, this.subTitle, this.isAvailable);

  factory DialogInfo.fromJson(Map<String, dynamic> json) {
    return DialogInfo(
      json['title'] ?? '',
      json['subtitle'] ?? '',
      json['isAvailable'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'subtitle': subTitle, 'isAvailable': isAvailable};
  }
}
