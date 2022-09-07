import 'package:flutter/material.dart';
import 'package:my_todo_app/home_page.dart';

import '../task.dart';

class TaskWidgetAdd extends StatefulWidget {

  /*==================[Variables]===================*/
  // List to add tasks
  static List<Task> allTasks = [];

  final  formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  /*================================================*/

  /*==================[Methods]===================*/

  // To add new task
  void addNewTask(BuildContext context) {
    TaskWidgetAdd.allTasks.add(Task(title: titleController.text,description: descriptionController.text));
    Navigator.pop(context);
    print( TaskWidgetAdd.allTasks);
  }

   // To change task status from done to undone vice
  static void changeStatus(int taskIndex){
    allTasks[taskIndex].status = !allTasks[taskIndex].status;
  }

  // To remove task when clicking on "delete" icon
  static void deleteTask(int taskIndex){
    allTasks.removeAt(taskIndex);
  }

  // To remove all tasks when clicking on "delete" in the appbar
  static void deleteAllTasks(){
      allTasks.clear();
  }
  /*================================================*/
  @override
  State<TaskWidgetAdd> createState() => _TaskWidgetAddState();
}

class _TaskWidgetAddState extends State<TaskWidgetAdd> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent[100],
      padding: const EdgeInsets.all(22),
      child: Form(
        key: widget.formKey,
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
              controller: widget.titleController,
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
              controller: widget.descriptionController,
              maxLength: 60,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Add description'),
            ),
            TextButton(
                onPressed: () {
                  if(widget.formKey.currentState!.validate() == true){
                    widget.addNewTask(context);
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
