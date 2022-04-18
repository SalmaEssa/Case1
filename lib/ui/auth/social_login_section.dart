import 'package:casestudy1/bloc/auth/auth_bloc.dart';
import 'package:casestudy1/bloc/auth/auth_event.dart';
import 'package:casestudy1/resources/colors.dart';
import 'package:casestudy1/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// ignore: implementation_imports

class SocialLoginSection extends StatelessWidget {
  SocialLoginSection({Key? key}) : super(key: key);
  final AuthBloc _authBloc = GetIt.instance<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildORRow(),
        _buildSocialButtons(context),
      ],
    );
  }

  Widget _buildORRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 21),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Divider(color: AppColors.primary)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                AppStrings.or,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.white),
              ),
            ),
            const Expanded(
              child: Divider(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(context, GoogleLoginTapped(), AssetStrings.google),
      ],
    );
  }

  Widget _buildSocialButton(
      BuildContext context, AuthEvent event, String assetImagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          _authBloc.dispatch(event);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1)),
            ],
            image: DecorationImage(
              image: AssetImage(assetImagePath),
            ),
          ),
        ),
      ),
    );
  }
}
