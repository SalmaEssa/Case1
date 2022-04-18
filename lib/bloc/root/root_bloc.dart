import 'package:casestudy1/bloc/auth/auth_bloc.dart';
import 'package:casestudy1/bloc/root/root_event.dart';
import 'package:casestudy1/services/user_service.dart';

import '../bloc.dart';
import 'package:get_it/get_it.dart';

class RootBloc extends BLoC<RootEvent> {
  @override
  void dispatch(RootEvent event) async {
    if (event is ModulesInitialized) {
      _initData();
    }
  }

  void _initData() {
    GetIt.instance.registerSingleton<UserService>(UserService());
    GetIt.instance.registerLazySingleton<AuthBloc>(() => AuthBloc());
  }
}
