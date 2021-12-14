import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MainDriver());
}
class MainDriver extends StatelessWidget {
  // const MainDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:Login(),
      )
    );
  }
}


