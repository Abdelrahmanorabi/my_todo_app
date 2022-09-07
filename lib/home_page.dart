import 'package:flutter/material.dart';
import 'package:my_todo_app/reusable_components/task_counter.dart';
import 'package:my_todo_app/reusable_components/task_widget_add_page.dart';
import 'package:my_todo_app/reusable_components/todo_card.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*==================[Methods]=====================*/

  // To show bottomSheet Screen
  void showBottomSheetDetails() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (buildContext) {
          return TaskWidgetAdd();
        });
  }

  //To refresh page details by pulling down
  Future<void> refreshPage() async {
    setState(() {
      TaskWidgetAdd.allTasks;
      print(TaskWidgetAdd.allTasks);
    });
  }

  /* you can use this method  for Dialog instead of BottomSheet if you want later
  * notice : you have to change Container height in TaskWidgetAdd Class
  *
  *
  *  void showDialogDetails(){
    showDialog(
        context: context,
        builder: (buildContext){
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11)
            ),
            child: TaskWidgetAdd(),

          );
        });
  }
  * */
  /*================================================*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        elevation: 0,
        title: const Text(
          'TO DO APP',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              TaskWidgetAdd.deleteAllTasks();
            },
            tooltip: 'delete @ll',
            iconSize: 27,
            icon: const Icon(
              Icons.delete_forever,
              color: Color.fromARGB(255, 142, 31, 54),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              refreshPage();
            },
            backgroundColor: Colors.green,
            child:const Icon(
              Icons.refresh,
              size: 20,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width*.05,),
          FloatingActionButton(
            onPressed: () {
              showBottomSheetDetails();
              // showDialogDetails(); you can use this method to use Dialog instead of Bottom sheet
            },
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.add,
              size: 20,
            ),
          ),


        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TaskCounter(),
            Expanded(
                child: RefreshIndicator(
              onRefresh: refreshPage,
              child: ListView.builder(
                  itemCount: TaskWidgetAdd.allTasks.length,
                  itemBuilder: (buildContext, index) {
                    return TodoCard(
                      title: TaskWidgetAdd.allTasks[index].title,
                      description: TaskWidgetAdd.allTasks[index].description,
                      isDone: TaskWidgetAdd.allTasks[index].status,
                      changeStatus: () {
                        TaskWidgetAdd.changeStatus(index);
                      },
                      deleteTask: () {
                        TaskWidgetAdd.deleteTask(index);
                      },
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
