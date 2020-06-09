import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolisting/Screens/addTask.dart';
import 'package:todolisting/model/taskData.dart';
import 'package:todolisting/widgets/taskslist.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String task;

  Widget buildBottomSheet(BuildContext context) {
    return AddTask(
      addTaskFunction: () {
        Provider.of<TaskData>(context, listen: false).addItem(task);

        Navigator.pop(context);
      },
      task: task,
      onChangingText: (value) {
        setState(() {
          task = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.only(top: 60.0, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todos',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${Provider.of<TaskData>(context, listen: true).tasks.length} Tasks",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: TasksList(
                tasks: Provider.of<TaskData>(context, listen: true).tasks,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: buildBottomSheet,
          );
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
