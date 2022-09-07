import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final Function changeStatus;
  final Function deleteTask;
  TodoCard(
      {required this.title,
      required this.description,
      required this.changeStatus,
      required this.deleteTask,
      this.isDone = false});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.blueGrey[700],
            borderRadius: BorderRadius.circular(11)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style:  TextStyle(
                  decoration: (isDone)? TextDecoration.lineThrough:TextDecoration.none,
                    decorationThickness: 1,
                    decorationColor:Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:(isDone)?const Color.fromARGB(255, 27, 26, 26): Colors.white
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .60,
                child: Text(
                  description,
                  maxLines: 2,
                  style:  TextStyle(
                    decoration: (isDone)? TextDecoration.lineThrough:TextDecoration.none,
                    decorationThickness: 1,
                    decorationColor:Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: (isDone)?const Color.fromARGB(200, 27, 26, 26):Colors.white,
                  ),
                ),
              ),
            ]),
            (isDone)
                ?
            Expanded(
              child: IconButton(
                onPressed: () {
                  changeStatus();
                },
                tooltip:'undone',
                iconSize: 22,
                icon: const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ):Expanded(
              child: IconButton(
                onPressed: () {
                  changeStatus();
                },
                iconSize: 22,
                tooltip:'done',
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*.05,),
            Expanded(
              child: IconButton(
                onPressed: () {
                  deleteTask();
                },
                tooltip:'delete',
                iconSize: 22,
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 230, 109, 132),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*.02,),

          ],
        ),
      ),
    );
  }
}
