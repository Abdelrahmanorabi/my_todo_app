import 'package:flutter/material.dart';
import 'package:my_todo_app/reusable_components/theme_bottom_sheet.dart';

import 'language_bottom_sheet.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = 'setting';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // To show Language BottomSheet
  void showLanguageBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }

  // To show Theme BottomSheet
  void showThemeBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
          elevation: 0,
          title: const Text(
            'setting',
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  border: Border.all(width: .7, color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Engish',style: TextStyle(color: Colors.white,fontSize: 18),),
                    IconButton(
                      onPressed: () {
                        showLanguageBottomSheet();
                      },
                      icon: const Icon(Icons.arrow_drop_down_circle_rounded,color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              const Text(
                'Theme',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    border: Border.all(width: .7, color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Dark',style: TextStyle(color: Colors.white,fontSize: 18)),
                    IconButton(
                      onPressed: () {
                        showThemeBottomSheet();
                      },
                      icon: const Icon(Icons.arrow_drop_down_circle_rounded,color: Colors.white,),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
