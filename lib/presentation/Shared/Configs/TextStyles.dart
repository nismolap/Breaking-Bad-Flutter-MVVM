import 'package:flutter/material.dart';
import 'package:BreakingBad/presentation//Shared/Configs/Colors.dart';
import 'package:BreakingBad/presentation/Shared/Configs/Constants.dart';

class AppTextStyle {
  //Header Style
  static TextStyle headerStyle(
      {double size = 30.0,
      String fontFamily = Constants.fontFamily,
      Color color = AppColors.secondaryColor1}) {
    return TextStyle(fontSize: size, fontFamily: fontFamily, color: color);
  }

  //Card Title Style
  static TextStyle titleStyle(
      {double size = 18.0,
      String fontFamily = Constants.fontFamily,
      Color color = AppColors.secondaryColor3}) {
    return TextStyle(fontSize: size, fontFamily: fontFamily, color: color);
  }

  //Card Nickname Style
  static TextStyle nickNameStyle(
      {double size = 18.0,
      String fontFamily = Constants.fontFamily,
      Color color = AppColors.primaryColor1}) {
    return TextStyle(fontSize: size, fontFamily: fontFamily, color: color);
  }

  //Card SubTitle Style
  static TextStyle subTitleStyle(
      {double size = 18.0,
      String fontFamily = Constants.fontFamily,
      Color color = AppColors.primaryColor2}) {
    return TextStyle(fontSize: size, fontFamily: fontFamily, color: color);
  }
}

class Shadow {
  static shadow({
    Color color = AppColors.secondaryColor3,
    double opacity = 0.5,
    double spread = 0,
    double blur = 10,
    double offsetX = 0,
    double offsetY = 4,
  }) {
    return BoxShadow(
      color: color.withOpacity(opacity),
      spreadRadius: spread,
      blurRadius: blur,
      offset: Offset(offsetX, offsetY), // changes position of shadow
    );
  }
}
