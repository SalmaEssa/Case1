import 'package:casestudy1/my_app.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 

  //Intentional App crash - ENABLE ONLY TO TEST [Crashlytics]
  //FirebaseCrashlytics.instance.crash();
  runApp(const MyApp());
}
