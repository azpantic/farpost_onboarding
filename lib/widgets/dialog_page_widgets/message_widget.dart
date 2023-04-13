import 'package:flutter/material.dart';
import '../../models/dialog.dart';

class MessageWidget extends StatelessWidget {
  // TODO: ипользовать цвета из темы
  final Color myMessageColor = Colors.deepOrange;
  final Color otherMessageColor = Colors.white60;

  final Color myTextColor = Colors.white;
  final Color otherTextColor = Colors.black;

  final Message msg;
  const MessageWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: msg.isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: msg.isMine
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
          color: msg.isMine ? myMessageColor : otherMessageColor,
        ),
        child: Text(
          msg.text,
          style: TextStyle(
            fontSize: 16,
            color: msg.isMine ? myTextColor : otherTextColor,
          ),
        ),
      ),
    );
  }
}
