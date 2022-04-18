import 'package:casestudy1/bloc/auth/auth_event.dart';
import 'package:casestudy1/bloc/auth/auth_state.dart';
import 'package:casestudy1/bloc/bloc.dart';
import 'package:casestudy1/resources/strings.dart';
import 'package:casestudy1/services/user_service.dart';
import 'package:get_it/get_it.dart';

import 'package:rxdart/rxdart.dart';

class AuthBloc extends BLoC<AuthEvent> {
  final PublishSubject<AuthState> authSubject = PublishSubject<AuthState>();
  final UserService _usersService = GetIt.instance<UserService>();

  @override
  void dispatch(AuthEvent event) async {
    if (event is LoginTapped) {
      _logIn(event);
    }

    if (event is SignUpTapped) {
      _signUp(event);
    }
    if (event is UserDataRequested) {
      _getUserData();
    }
  }

  Future<void> _getUserData() async {
    String? email = await _usersService.getEmail();
    authSubject.sink.add(UserDataIs(email: email));
  }

  Future<void> _signUp(SignUpTapped event) async {
    try {
      await _usersService.signUp(
          event.email, event.password, event.name, event.confirmPassword);
      authSubject.sink.add(UserSignedUp());
    } catch (error) {
      authSubject.sink.add(SignUpError(msg: AppStrings.somethingWentWrong));
    }
  }

  Future<void> _logIn(LoginTapped event) async {
    try {
      await _usersService.logIn(event.email, event.password);
      authSubject.sink.add(UserLoggedIn());
    } catch (error) {
      authSubject.sink.add(LoginError(msg: AppStrings.somethingWentWrong));
    }
  }

  void dispose() {
    authSubject.close();
  }
}
