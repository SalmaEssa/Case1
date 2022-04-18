import 'package:flutter/material.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {
  final BuildContext context;
  AppStarted(this.context);
}

class LoginTapped extends AuthEvent {
  String email;
  String password;
  LoginTapped(this.email, this.password);
}

class GoogleLoginTapped extends AuthEvent {}

class SignUpTapped extends AuthEvent {
  String email;
  String password;
  String confirmPassword;
  String name;

  SignUpTapped(this.email, this.password, this.confirmPassword, this.name);
}

class UserDataRequested extends AuthEvent {}
