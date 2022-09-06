import 'package:flutter/material.dart';
import 'package:my_todo_app/reusable_components/todo_card.dart';
import 'package:my_todo_app/task.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*==================[Variables]===================*/
  List<Task> allTasks = [
    Task(title: 'title1', status: false),
    Task(title: 'title2', status: false),
    Task(title: 'title3', status: true),
    Task(title: 'title4', status: false),
  ];

  /*================================================*/

  /*==================[Methods]=====================*/
  /*================================================*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'TO DO APP',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (buildContext, index) {
                      return TodoCard(
                        title: allTasks[index].title,
                        isDone: allTasks[index].status,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
