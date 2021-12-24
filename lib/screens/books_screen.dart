import 'package:flutter/material.dart';
import 'package:flutter_dotnet/models/books.dart';
import 'package:http/http.dart';

class BooksScreen extends StatefulWidget {
  BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  List<Book> _books = [];
  @override
  void initState() {
    super.initState();
  }

  Future<List<Book>> _getBooks() async {
    Map<String, String> headers = {'': "", "": ""};
    // final response = await get(Uri.parse('http://localhost:28057/api/Books'), headers: headers);

    return [
      Book(
          id: 'book_1',
          datePublished: DateTime.parse('2020-02-01'),
          isbn: '1234567',
          title: 'Harry Potter'),
      Book(
          id: 'book_2',
          datePublished: DateTime.parse('2021-02-01'),
          isbn: '1234567',
          title: 'Green Mile'),
      Book(
          id: 'book_3',
          datePublished: DateTime.parse('2020-02-02'),
          isbn: '1234567',
          title: 'Python Course'),
      Book(
          id: 'book_4',
          datePublished: DateTime.parse('2020-02-03'),
          isbn: '1234567',
          title: 'C# Cool Course'),
      Book(
          id: 'book_5',
          datePublished: DateTime.parse('2020-02-04'),
          isbn: '1234567',
          title: 'Blue Wind'),
      Book(
          id: 'book_6',
          datePublished: DateTime.parse('2020-02-05'),
          isbn: '1234567',
          title: 'Tokyo Ghoul'),
      Book(
          id: 'book_7',
          datePublished: DateTime.parse('2020-02-06'),
          isbn: '1234567',
          title: 'Amaterasu no Kiba'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: FutureBuilder<List<Book>>(
        future: _getBooks(),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 64.0,
                          height: 64.0,
                          child: Image.network(
                              'https://c.tenor.com/6MsukwHKJ58AAAAM/ara-anime.gif'),
                        ),
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data![index].title),
                            Text(snapshot.data![index].datePublished
                                .toString()
                                .substring(0, 10))
                          ],
                        )
                      ],
                    ),
                  ));
                });
          } else if (snapshot.hasError) {
            return Column(children: <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ]);
          } else {
            return Column(children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ]);
          }
        },
      ),
    );
  }
}
