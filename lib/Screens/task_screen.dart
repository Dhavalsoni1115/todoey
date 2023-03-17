import 'package:flutter/material.dart';
import 'package:todoey_list/Screens/add_task_screen.dart';
import 'package:todoey_list/constants.dart';
import '../model/task_model.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Butter Milk'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(addTaskCallBack: (newTask) {
                  setState(() {
                    tasks.add(Task(name: newTask));
                  });
                  Navigator.pop(context);
                }),
              ),
            ),
          );
        },
        backgroundColor: backgroundColor,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 55, right: 30, left: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 35,
                    color: backgroundColor,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: TaskList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}
