import 'dart:convert';

import 'package:authapi/constants/constants.dart';
import 'package:authapi/screens/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password1Controller = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();

  Future<void> saveData() async {
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password1 = _password1Controller.text;
    final String password2 = _password2Controller.text;
    if (username.isNotEmpty && email.isNotEmpty && password1.isNotEmpty) {
      if (password1 == password2) {
        final response = await http.post(
          Uri.parse("http://10.0.2.2:8000"),
          headers: {
            'Content-Type': 'application/json',
            // 'Accept': "application/json"
          },
          body: json.encode(
              {'username': username, 'email': email, "password": password1}),
        );
        if (response.statusCode == 201) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SignIn()));
          _usernameController.text = "";
          _emailController.text = "";
          _password1Controller.text = "";
          _password2Controller.text = "";
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text("Data saved"),
          //   backgroundColor: Color.fromARGB(255, 32, 255, 7),
          // ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Something went wrong"),
            backgroundColor: Color.fromARGB(255, 32, 255, 7),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password not matched"),
          backgroundColor: Color.fromARGB(255, 32, 255, 7),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid credentials!"),
        // backgroundColor: Constants.themeColor,
      ));
    }
    // setState(() {
    //   datalist = [];
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 90, 207, 203),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SignUp",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField("Username", _usernameController, false),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField("Enter your Email", _emailController, false),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField("Password", _password1Controller, true),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField("Confirm password", _password2Controller, true),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        saveData();
                      },
                      child: Text("Signup"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 233, 198),
                          elevation: 10),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(
                      text: "Already have account? ",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: "LogIn",
                            style: const TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignIn()));
                              }),
                      ],
                    )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget MyTextField(
      String hint, TextEditingController textController, bool obscure) {
    return TextFormField(
      obscureText: obscure,
      onChanged: (value) {},
      controller: textController,
      decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: hint,
          labelStyle: TextStyle(color: Colors.white),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    );
  }
}
