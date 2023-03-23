import 'package:clean_project/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  List<Task> taskList = [
     Task('Arrumar a cama', 'assets/images/arrumarcama.jpg', 7),
     Task('Lavar a louça', 'assets/images/lavarlouca.jpeg', 7),
     Task('Varrer a casa', 'assets/images/varrercasa.jpeg', 5),
     Task('Aspirar a casa', 'assets/images/aspirarcasa.jpeg', 5),
     Task('Passar pano', 'assets/images/passarpano.jpeg', 2),
  ];

  void newTask(String name, String photo, int quantity) {
    taskList.add(Task(name, photo, quantity),);
  }


  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<
        TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
