import 'package:auto_route/auto_route.dart';
import 'package:casestudy1/main_router.gr.dart';
import 'package:casestudy1/ui/auth/social_login_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:casestudy1/resources/colors.dart';
import 'package:casestudy1/resources/strings.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.disabledGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Image.asset(AssetStrings.logo),
              ),
              _buildSigninButton(),
              _buildSignupButton(),
              SocialLoginSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSigninButton() {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: AppColors.black),
      ),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
          AutoRouter.of(context).push(const LogInRoute());
        },
        child: Center(
          child: Text(AppStrings.logIn,
              style: const TextStyle(color: AppColors.black, fontSize: 18)),
        ),
      ),
    );
  }

  Widget _buildSignupButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
          AutoRouter.of(context).push(const SignUpRoute());
        },
        child: Center(
          child: Text(AppStrings.signUp,
              style: const TextStyle(color: AppColors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
