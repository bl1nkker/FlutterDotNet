import 'package:flutter/material.dart';
import 'package:flutter_dotnet/screens/books_screen.dart';
import 'package:flutter_dotnet/screens/profile_screen.dart';

class Home extends StatefulWidget {
  final dynamic currentUser;
  Home({Key? key, required this.currentUser}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [BooksScreen(), ProfileScreen(currentUser: widget.currentUser)];
    super.initState();
    // Fetch Books
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Create story');
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Explore', icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              label: 'Profile', icon: Icon(Icons.admin_panel_settings)),
        ],
      ),
      body: Container(
          child: IndexedStack(
        children: screens,
        index: _currentIndex,
      )),
    ));
  }
}
