import 'package:casestudy1/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  final int? size;
  const LoadingWidget({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100,
        child: LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [AppColors.primary],
          strokeWidth: 2,
          pathBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
