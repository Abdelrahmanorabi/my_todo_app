import 'package:flutter/material.dart';
import 'package:my_todo_app/reusable_components/setting_page.dart';
import 'package:my_todo_app/reusable_components/task_counter.dart';
import 'package:my_todo_app/reusable_components/task_list.dart';
import 'package:my_todo_app/reusable_components/task_widget_add_page.dart';
import 'package:my_todo_app/reusable_components/todo_card.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*==================[Variables]=====================*/
  int selectedIndex = 0;
  List<Widget> pages = [ TaskList(),SettingPage()];
  /*================================================*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue[900],
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Setting'),
        ],
      ),
      body: pages[selectedIndex]
    );
  }
}
