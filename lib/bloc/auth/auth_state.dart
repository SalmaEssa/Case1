abstract class AuthState {}

class UserLoggedIn extends AuthState {}

class LoginError extends AuthState {
  String? msg;

  LoginError({required this.msg});
}

class UserDataIs extends AuthState {
  String? email;

  UserDataIs({this.email});
}

class UserSignedUp extends AuthState {}

class SignUpError extends AuthState {
  String? msg;

  SignUpError({required this.msg});
}
