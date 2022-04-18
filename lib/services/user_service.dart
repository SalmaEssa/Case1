import 'package:http/http.dart';

class UserService {
  String? _email;
  Future<String?>? getEmail() async {
    await Future.delayed(const Duration(seconds: 3));

    return _email;
  }

  Future<void> logIn(String email, String password) async {
    _email = email;
    await post(Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password});
  }

  Future<void> signUp(String email, String password, String name,
      String confirmPassword) async {
    _email = email;
    await post(Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password});
  }
}
