import 'package:flutter/material.dart';
import 'package:flutter_dotnet/models/books.dart';
import 'package:flutter_dotnet/screens/books_screen.dart';
import 'package:flutter_dotnet/screens/profile_screen.dart';
import 'package:http/http.dart';

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
        onPressed: () async {
          // Here we will add stories
          Book book = Book(
              id: 'book_111',
              datePublished: DateTime.parse('2020-02-06'),
              isbn: '1234567',
              title: 'Amaterasu no Kiba');
          final response = await post(
              Uri.parse('http://localhost:28057/api/Books'),
              body: book.toJson());
          if (response.statusCode == 200) {
            print('Книга успешно создана');
          } else {
            print('Что то пошло не так');
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.book, color: Colors.white),
              activeIcon: Icon(Icons.book_outlined, color: Colors.white)),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.verified_user, color: Colors.white),
              activeIcon:
                  Icon(Icons.verified_user_outlined, color: Colors.white)),
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
