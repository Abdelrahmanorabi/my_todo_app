import 'package:flutter/material.dart';
import 'package:my_todo_app/task.dart';

class TodoCard extends StatelessWidget {
   // Task task;
    String title;
    bool isDone;
  TodoCard({required this.title,required this.isDone});


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      child: Container(
        margin:const EdgeInsets.only(top: 20),
        padding:const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color:const Color.fromRGBO(209, 224 , 224, 0.1),
            borderRadius: BorderRadius.circular(11)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            (isDone)?const Icon(
              Icons.check,
              size: 22,
              color: Colors.green,
            ):const Icon(
              Icons.close,
              size: 22,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
