import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_dotnet/home.dart';
import 'package:flutter_dotnet/models/user.dart';
import 'package:flutter_dotnet/screens/books_screen.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _signInUser() async {
    // Send user credential to server
    String login = _emailController.text;
    String password = _passwordController.text;
    Map<String, String> headers = {'': "", "": ""};
    final body =
        jsonEncode(<String, String>{"login": login, "password": password});
    User user =
        User(email: 'amir@mail.ru', firstname: 'Amir', lastname: 'Ibragimov');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext lowLevelContext) => Home(
                  currentUser: user,
                )));
    // final response =
    //     await post(Uri.parse('http://localhost:28057/api/Authors/authenticate'), headers: headers, body: body);
    // if (response.statusCode == 200) {
    //   String token = jsonDecode(response.body)['token'];
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   await prefs.setString('token', token);
    //   User user = User.fromJson(jsonDecode(response.body));
    //   // Save to shared preferences
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (BuildContext lowLevelContext) => Home(
    //                 currentUser: user,
    //               )));
    // } else {
    //   print('Something went wrong');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Your email here',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Your password here',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
                onTap: _signInUser,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0)),
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  child: const Center(
                      child: Text('CREATE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2))),
                ))
          ],
        ),
      ),
    ));
  }
}
