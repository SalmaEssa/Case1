import 'package:casestudy1/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  final Color? loadrerColor;
  const Loader({Key? key, this.loadrerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: loadrerColor ?? AppColors.white,
      size: 20,
    );
  }
}
