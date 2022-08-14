import 'package:flutter/material.dart';
import 'package:BreakingBad/View/Shared/Configs/Colors.dart';
import 'package:BreakingBad/View/Shared/Configs/TextStyles.dart';

class HeaderWidget extends StatelessWidget {
  final String headerLeftText;

  final String headerRightText;

  const HeaderWidget(
      {Key? key, required this.headerLeftText, required this.headerRightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: AppColors.secondaryColor2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(45),
                )),
            child: Text(
              headerLeftText,
              style: AppTextStyle.headerStyle(),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: AppColors.secondaryColor1,
                radius: 5,
              )),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: AppColors.primaryColor1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Text(
              headerRightText,
              style: AppTextStyle.headerStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
