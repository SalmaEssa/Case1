import 'package:casestudy1/resources/colors.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final Function() onTapped;

  const HeaderWidget({Key? key, required this.title, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            InkWell(
                onTap: onTapped,
                child:
                    const Icon(Icons.arrow_back_sharp, color: AppColors.black)),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
