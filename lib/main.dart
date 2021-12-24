import 'package:flutter/material.dart';
import 'package:flutter_dotnet/home.dart';
import 'package:flutter_dotnet/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // TODO: Shared Preferences token restoration
    // token = '123';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token.isEmpty ? LoginScreen() : Home(),
    );
  }
}
