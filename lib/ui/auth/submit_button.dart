import 'package:casestudy1/resources/colors.dart';
import 'package:casestudy1/ui/auth/loader_widget.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function()? onPressed;
  final bool? isLoading;
  final Widget? buttonText;
  const SubmitButton(
      {Key? key, this.onPressed, this.isLoading, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 60),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onPressed,
        child: isLoading ?? false ? const Loader() : buttonText ?? Container(),
      ),
    );
  }
}
