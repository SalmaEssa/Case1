import 'package:casestudy1/bloc/auth/auth_bloc.dart';
import 'package:casestudy1/bloc/auth/auth_event.dart';
import 'package:casestudy1/bloc/auth/auth_state.dart';
import 'package:casestudy1/resources/colors.dart';
import 'package:casestudy1/resources/strings.dart';
import 'package:casestudy1/ui/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  String? _email;
  final AuthBloc _authBloc = GetIt.instance<AuthBloc>();

  @override
  void initState() {
    _authBloc.authSubject.listen((state) {
      if (state is UserDataIs) {
        //   AutoRouter.of(context).push(const LogInRoute());
        setState(() {
          _isLoading = false;
          _email = state.email;
        });
      }
    });
    _authBloc.dispatch(UserDataRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.disabledGray,
      body: _isLoading
          ? const LoadingWidget()
          : SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Image.asset(
                      AssetStrings.logo,
                      width: double.infinity,
                      //height: ,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          "Hello ${_email ?? ''}",
                          style: const TextStyle(
                              color: AppColors.pink,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
