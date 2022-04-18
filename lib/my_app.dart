import 'dart:async';
import 'package:casestudy1/bloc/root/root_bloc.dart';
import 'package:casestudy1/bloc/root/root_event.dart';
import 'package:casestudy1/main_router.gr.dart';

import 'package:casestudy1/resources/colors.dart';
import 'package:casestudy1/resources/strings.dart';
import 'package:casestudy1/resources/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  static RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  String _locale = CodeStrings.englishCode;
  late RootBloc _rootBloc;
  StreamSubscription? _settingsSubscription;
  // AuthBloc? _authBloc;
  StreamSubscription? _authSub;
  String internetToastMessage = "";
  Color internetToastColor = AppColors.accent;

  @override
  void initState() {
    GetIt.instance.registerSingleton<RootBloc>(RootBloc());
    _rootBloc = GetIt.instance<RootBloc>();
    _rootBloc.dispatch(ModulesInitialized(context));
    _rootBloc.dispatch(PackageInfoRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [MyApp.routeObserver],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: _locale == CodeStrings.arabicCode
          ? AppThemes.arabicAppTheme
          : AppThemes.englishAppTheme,
      builder: (context, widget) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Directionality(
          textDirection: _locale == CodeStrings.arabicCode
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: widget ?? Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _settingsSubscription?.cancel();
    _authSub?.cancel();
    super.dispose();
  }
}

class PingBenchmarkResult {
  String message;
  Color color;
  PingBenchmarkResult(this.message, this.color);
}
