import 'package:flutter/material.dart';
import 'package:BreakingBad/View/Shared/Configs/Colors.dart';
import 'package:BreakingBad/View/Shared/Configs/TextStyles.dart';

class InfoCardWidget extends StatelessWidget {
  final String? title;
  final String? info;

  const InfoCardWidget({Key? key, required this.title, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        Expanded(
          flex: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor1,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [Shadow.shadow()],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                      child: Text(
                    '$title : ',
                    style: AppTextStyle.subTitleStyle(),
                  )),
                ),
                Expanded(
                  child: Wrap(
                    children: [
                      Center(
                          child: Text(
                        info!,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.subTitleStyle(),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
