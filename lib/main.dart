import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolisting/Screens/taskScreen.dart';

import 'model/taskData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        home: TasksScreen(),
      ),
      create: (context) => TaskData(),
    );
  }
}
