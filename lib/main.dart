import 'package:estore/screens/base_screen.dart';
import 'package:estore/screens/home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(eStore());
}

class eStore extends StatelessWidget {
  const eStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseScreen(),
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
    );
  }
}
