import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({Key? key}) : super(key: key);

  @override
  _SharedPreferenceState createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  void check_if_already_login(BuildContext context) async {

    var logindata = await SharedPreferences.getInstance();
    var newUser = (logindata.getBool('login') ?? true);

    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => Home(),));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}


