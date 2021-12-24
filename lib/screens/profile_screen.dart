import 'package:flutter/material.dart';
import 'package:flutter_dotnet/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          bottom: 0,
          right: MediaQuery.of(context).size.width * .45,
          child: InkWell(
            child: Text('Log Out'),
          )),
      Center(
          child: Text(
        "Hello, ${currentUser.firstname} ${currentUser.lastname}!",
        style: TextStyle(fontSize: 48.0),
        textAlign: TextAlign.center,
      ))
    ]);
  }
}
