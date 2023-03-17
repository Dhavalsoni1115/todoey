import 'package:flutter/material.dart';
import 'package:todoey_list/model/task_model.dart';
import 'package:todoey_list/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  const TaskList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     // reverse: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) => TaskTile(
        isChecked: widget.tasks[index].isDone,
        taskName: widget.tasks[index].name,
        onChnage: (value) {
          setState(
            () {
              widget.tasks[index].isDone = value;
            },
          );
        },
      ),
    );
  }
}
