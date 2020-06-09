import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolisting/model/task.dart';
import 'package:todolisting/model/taskData.dart';
import 'package:todolisting/widgets/tasktitle.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList({this.tasks});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTitle(
          longPress: () {
            Provider.of<TaskData>(context, listen: false).deleteTask(
                Provider.of<TaskData>(context, listen: false).tasks[index]);
          },
          text: widget.tasks[index].name,
          values: widget.tasks[index].isDone,
          onPressed: (value) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
