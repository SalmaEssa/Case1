import 'package:flutter/cupertino.dart';

abstract class RootEvent {}

class ModulesInitialized extends RootEvent {
  BuildContext context;
  ModulesInitialized(this.context);
}

class ModulesRestarted extends RootEvent {}

class PackageInfoRequested extends RootEvent {}
