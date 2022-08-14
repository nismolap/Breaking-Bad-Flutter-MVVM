import 'package:flutter/material.dart';
import 'package:BreakingBad/View/Shared/Configs/Colors.dart';
import 'package:BreakingBad/View/Shared/Configs/Constants.dart';
import 'package:BreakingBad/View/Shared/Configs/TextStyles.dart';
import 'package:url_launcher/url_launcher.dart';

class BehanceWidget extends StatelessWidget {
  final String buttonText;
  final String link;
  final Color backgroundColor;
  final Color textColor;
  const BehanceWidget({Key? key, this.buttonText = Constants.behanceText, this.link = Constants.behanceLink, this.backgroundColor = AppColors.secondaryColor4, this.textColor = AppColors.secondaryColor1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){launchUrl(Uri.parse(link),mode: LaunchMode.externalApplication);},
      child: Container(
        width: 250,
        height: 70,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [Shadow.shadow()],
        ),
        child: Center(
            child: Text(
          buttonText,
          style: AppTextStyle.titleStyle(color: textColor),
        )),
      ),
    );
  }
}
