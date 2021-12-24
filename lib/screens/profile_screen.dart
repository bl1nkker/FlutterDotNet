import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);

  final dynamic currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Profile Screen"));
  }
}
