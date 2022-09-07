import 'package:flutter/material.dart';
import 'package:my_todo_app/home_page.dart';

import '../task.dart';

class TaskWidgetAdd extends StatefulWidget {

  /*==================[Variables]===================*/
  static List<Task> allTasks = [
    Task(title: 'feed11', status: false),
    Task(title: 'feed12', status: true),
  ];  /*================================================*/

  @override
  State<TaskWidgetAdd> createState() => _TaskWidgetAddState();
}

class _TaskWidgetAddState extends State<TaskWidgetAdd> {
  /*==================[Variables]===================*/
  TextEditingController titleController = TextEditingController();
  final  formKey = GlobalKey<FormState>();
  /*================================================*/

  /*==================[Methods]===================*/

  void addNewTask() {
    TaskWidgetAdd.allTasks.add(Task(title: titleController.text));
    Navigator.pop(context);
    print( TaskWidgetAdd.allTasks);
  }

  /*================================================*/
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent[100],
      padding: const EdgeInsets.all(22),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value){
                if(value==null|| value.trim().isEmpty){
                  return'You must enter task title';
                }
                return null;
              },
              controller: titleController,
              maxLength: 20,
              decoration: const InputDecoration(labelText: 'Add New Task'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            TextButton(
                onPressed: () {
                  if(formKey.currentState!.validate() == true){
                    addNewTask();
                  }

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                ),
                child: const Text(
                  'ADD',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
