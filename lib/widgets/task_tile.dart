import 'package:flutter/material.dart';

import '../constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  final Function(dynamic) onChnage;
  const TaskTile(
      {Key? key,
      required this.isChecked,
      required this.taskName,
      required this.onChnage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: backgroundColor,
        value: isChecked,
        onChanged: onChnage,
      ),
    );
  }
}
