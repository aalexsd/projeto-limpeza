import 'package:clean_project/data/task_inherited.dart';
import 'package:clean_project/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.task_alt_outlined),
        title: const Text('Limpeza semanal'),
        backgroundColor: Colors.pink[100],
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(bottom: 100),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        backgroundColor: Colors.pink[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
