class User {
  final String email;
  final String password;
  final String name;

  User({required this.email, required this.name, required this.password});

  // factory User.fromJson((json) =>{
  //   return '123'
  // })
}
