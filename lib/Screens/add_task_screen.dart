import 'package:flutter/material.dart';

import '../constants.dart';

class AddTaskScreen extends StatefulWidget {
  Function(dynamic) addTaskCallBack;
  AddTaskScreen({Key? key, required this.addTaskCallBack}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                fontSize: 30,
                color: backgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTask = value.toString();
              },
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: MaterialButton(
                onPressed: () {
                  // print(name);
                  widget.addTaskCallBack(newTask);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
