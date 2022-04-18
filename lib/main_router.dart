import 'package:auto_route/annotations.dart';
import 'package:casestudy1/UI/auth/login_screen.dart';
import 'package:casestudy1/UI/auth/signup_screen.dart';

import 'package:casestudy1/ui/auth/welcome_screen.dart';
import 'package:casestudy1/ui/home/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomeScreen, initial: true),
    AutoRoute(page: LogInScreen),
    AutoRoute(page: SignupScreen),
    AutoRoute(page: HomeScreen),
  ],
)
class $AppRouter {}
