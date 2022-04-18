// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
import 'package:casestudy1/UI/auth/login_screen.dart' as _i4;
import 'package:casestudy1/UI/auth/signup_screen.dart' as _i5;
import 'package:casestudy1/ui/home/home_screen.dart' as _i6;

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import 'ui/auth/welcome_screen.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomeScreen());
    },
    LogInRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LogInScreen());
    },
    SignUpRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SignupScreen());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(WelcomeRoute.name, path: '/'),
        _i2.RouteConfig(LogInRoute.name, path: '/log-in-screen'),
        _i2.RouteConfig(SignUpRoute.name, path: '/sign-up-screen'),
        _i2.RouteConfig(HomeRoute.name, path: '/home-screen'),
      ];
}

/// generated route for [_i1.WelcomeScreen]
class WelcomeRoute extends _i2.PageRouteInfo<void> {
  const WelcomeRoute() : super(name, path: '/');

  static const String name = 'WelcomeRoute';
}

/// generated route for [_i4.LogInScreen]
class LogInRoute extends _i2.PageRouteInfo<void> {
  const LogInRoute() : super(name, path: '/log-in-screen');

  static const String name = 'LogInRoute';
}

/// generated route for [_i5.SignupScreen]
class SignUpRoute extends _i2.PageRouteInfo<void> {
  const SignUpRoute() : super(name, path: '/sign-up-screen');

  static const String name = 'SignUpRoute';
}

/// generated route for [_i6.HomeScreen]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-screen');

  static const String name = 'HomeRoute';
}
