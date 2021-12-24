class Book {
  final String id;
  final String isbn;
  final String title;
  final DateTime datePublished;

  Book(
      {required this.id,
      required this.datePublished,
      required this.isbn,
      required this.title});

  factory Book.fromJson(Map<dynamic, dynamic> json) => Book(
      id: json['id'] as String,
      datePublished: json['datePublished'],
      title: json['title'],
      isbn: json['isbn']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'datePublished': datePublished,
        'title': title,
        'isbn': isbn,
      };
}
