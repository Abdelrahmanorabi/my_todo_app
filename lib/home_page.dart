import 'package:flutter/material.dart';
import 'package:my_todo_app/reusable_components/task_widget_add_page.dart';
import 'package:my_todo_app/reusable_components/todo_card.dart';
import 'package:my_todo_app/task.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*==================[Variables]===================*/
  /*================================================*/
  /*==================[Methods]=====================*/

  void showBottomSheetDetails() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (buildContext) {
          return TaskWidgetAdd();
        });
  }
  // method to refresh page details by pulling down
  Future<void> refreshPage()async{
    setState(() {
      TaskWidgetAdd.allTasks;
    });
  }
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheetDetails();
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: RefreshIndicator(
                  onRefresh: refreshPage,
                  child: ListView.builder(
                      itemCount: TaskWidgetAdd.allTasks.length,
                      itemBuilder: (buildContext, index) {
                        return TodoCard(
                          title: TaskWidgetAdd.allTasks[index].title,
                          isDone: TaskWidgetAdd.allTasks[index].status,
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
