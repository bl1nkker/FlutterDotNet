import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch Books
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Books Screen'));
  }
}
