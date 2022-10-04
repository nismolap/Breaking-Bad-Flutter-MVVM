import 'package:flutter/material.dart';
import 'package:BreakingBad/presentation/Shared/Configs/Colors.dart';
import 'package:BreakingBad/presentation/Shared/Configs/Constants.dart';
import 'package:BreakingBad/presentation/Shared/Configs/TextStyles.dart';

class BehanceWidget extends StatelessWidget {
  final String buttonText;
  final Function() onPress;
  final Color textColor;
  const BehanceWidget({Key? key, this.buttonText = Constants.behanceText,required this.onPress, this.textColor = AppColors.secondaryColor1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        width: 250,
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [Shadow.shadow()],
        ),
        child: Center(
            child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyMedium,
        )),
      ),
    );
  }
}
