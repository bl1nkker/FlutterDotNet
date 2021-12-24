class User {
  final String email;
  final String firstname;
  final String lastname;

  User({required this.email, required this.firstname, required this.lastname});

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname']);
}
