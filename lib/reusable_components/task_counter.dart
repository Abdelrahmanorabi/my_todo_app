import 'package:flutter/material.dart';
import 'package:my_todo_app/reusable_components/task_widget_add_page.dart';

class TaskCounter extends StatelessWidget {
  /*==================[Methods]=====================*/
  int calculateCompletedTask() {
    int completedTasks = 0;
    for (var task in TaskWidgetAdd.allTasks) {
      if (task.status == true) {
        completedTasks++;
      }
    }
    return completedTasks;
  }

  /*================================================*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        '${calculateCompletedTask()}/${TaskWidgetAdd.allTasks.length}',
        style: TextStyle(
            fontSize: 40,
            color: (calculateCompletedTask() == TaskWidgetAdd.allTasks.length &&
                    calculateCompletedTask() != 0)
                ? Colors.greenAccent
                : Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
