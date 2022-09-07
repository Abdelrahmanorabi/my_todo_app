import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blueGrey[500],
                border: Border.all(width: 1,color: Colors.black),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: const [
                 Text('English',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 Icon(Icons.check)
               ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.black),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('العربية',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
               ],
              ),
            ),
          ],
        ),

    );
  }
}
