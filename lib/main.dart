import 'package:authapi/screens/homepage.dart';
import 'package:authapi/screens/signin.dart';
import 'package:authapi/screens/signup.dart';
import 'package:authapi/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var username = prefs.getString('username');
  print(email);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null
          ? SignIn()
          : HomePage(
              username: username.toString(),
            ),
    ),
  );
}
