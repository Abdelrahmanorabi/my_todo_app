import 'package:flutter/material.dart';
import 'package:my_todo_app/home_page.dart';

import '../task.dart';

class TaskWidgetAdd extends StatefulWidget {

  /*==================[Variables]===================*/
  static List<Task> allTasks = [
    // Task(title: 'feed11',description: 'www', status: true),
    // Task(title: 'feed12',description: 'eeee', status: true),
  ];

    static void changeStatus(int taskIndex){
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    }

  static void deleteTask(int taskIndex){
    allTasks.removeAt(taskIndex);
  }

  static void deleteAllTasks(){
      allTasks.clear();
  }
  /*================================================*/

  @override
  State<TaskWidgetAdd> createState() => _TaskWidgetAddState();
}

class _TaskWidgetAddState extends State<TaskWidgetAdd> {
  /*==================[Variables]===================*/
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final  formKey = GlobalKey<FormState>();
  /*================================================*/

  /*==================[Methods]===================*/

  void addNewTask() {
    TaskWidgetAdd.allTasks.add(Task(title: titleController.text,description: descriptionController.text));
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
            TextFormField(
              validator: (value){
                if(value==null|| value.trim().isEmpty){
                  return'You must enter task description';
                }
                return null;
              },
              controller: descriptionController,
              maxLength: 60,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Add description'),
            ),
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
