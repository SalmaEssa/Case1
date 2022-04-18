import 'package:auto_route/auto_route.dart';
import 'package:casestudy1/bloc/auth/auth_bloc.dart';
import 'package:casestudy1/bloc/auth/auth_event.dart';
import 'package:casestudy1/bloc/auth/auth_state.dart';
import 'package:casestudy1/main_router.gr.dart';
import 'package:casestudy1/resources/colors.dart';
import 'package:casestudy1/resources/strings.dart';
import 'package:casestudy1/ui/auth/submit_button.dart';
import 'package:casestudy1/ui/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _buttonLoading = false;
  final AuthBloc _authBloc = GetIt.instance<AuthBloc>();

  final InputBorder _border =
      const OutlineInputBorder(borderSide: BorderSide(color: AppColors.gray));
  final GlobalKey<FormState> _logInformKey = GlobalKey();
  bool _passwordObscure = true;

  @override
  void initState() {
    _authBloc.authSubject.listen((state) {
      if (state is UserLoggedIn) {
        setState(() {
          _buttonLoading = false;
        });
        AutoRouter.of(context)
            .pushAndPopUntil(const HomeRoute(), predicate: (r) => false);
      }
      if (state is LoginError) {
        setState(() {
          _buttonLoading = false;
        });
        _showErrorToast(state.msg);
      }
    });
    super.initState();
  }

  void _showErrorToast(String? errorMsg) {
    Fluttertoast.showToast(
        msg: errorMsg ?? '',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.redError,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.disabledGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(
                  title: AppStrings.logIn,
                  onTapped: () => AutoRouter.of(context).pop()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Image.asset(AssetStrings.logo),
              ),
              _buildLoginForm(),
              _buildloginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: _logInformKey,
        child: Column(
          children: [
            _buildInfoItem(
              title: AppStrings.email,
              hint: AppStrings.email,
              controller: _emailController,
              type: TextInputType.emailAddress,
            ),
            _buildPasswordField(
                _passwordObscure, _passwordController, AppStrings.password),
          ],
        ),
      ),
    );
  }

  Widget _buildloginButton() {
    return SubmitButton(
      onPressed: () {
        if ((_logInformKey.currentState?.validate() ?? false)) {
          setState(() {
            _buttonLoading = true;
          });
          _authBloc.dispatch(LoginTapped(
            _emailController.text,
            _passwordController.text,
          ));
        }
      },
      isLoading: _buttonLoading,
      buttonText: Center(
        child: Text(AppStrings.logIn,
            style: const TextStyle(color: AppColors.white, fontSize: 18)),
      ),
    );
  }

  Widget _buildInfoItem(
      {required String title,
      required String hint,
      required TextEditingController controller,
      TextInputType type = TextInputType.text}) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 5.0, top: 20),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "*",
              style: TextStyle(
                color: AppColors.redError,
              ),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: controller,
        keyboardType: type,
        validator: (value) {
          if (value?.trim().isEmpty ?? true) {
            return title + AppStrings.requeired;
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 0,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.gray),
          enabledBorder: _border,
          border: _border,
          focusedBorder: _border,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redError)),
        ),
      ),
    ]);
  }

  Widget _buildPasswordField(
      bool obscureFlag, TextEditingController controller, String title) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 5.0, top: 20),
        child: Row(
          children: [
            Text(title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                )),
            const Text(
              "*",
              style: TextStyle(
                color: AppColors.redError,
              ),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: controller,
        obscureText: obscureFlag,
        validator: (value) {
          if (value?.trim().isEmpty ?? true) {
            return title + AppStrings.requeired;
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 0,
          ),
          hintText: AppStrings.password,
          hintStyle: const TextStyle(color: AppColors.gray),
          enabledBorder: _border,
          border: _border,
          focusedBorder: _border,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redError)),
          suffixIcon: obscureFlag
              ? IconButton(
                  icon: const Icon(
                    Icons.visibility_off,
                    color: AppColors.gray,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordObscure = false;
                    });
                  })
              : IconButton(
                  icon: const Icon(Icons.visibility, color: AppColors.gray),
                  onPressed: () {
                    setState(() {
                      _passwordObscure = true;
                    });
                  }),
        ),
      ),
    ]);
  }
}
