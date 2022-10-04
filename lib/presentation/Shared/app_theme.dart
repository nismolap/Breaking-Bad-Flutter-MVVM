import 'package:BreakingBad/presentation/Shared/Configs/TextStyles.dart';
import 'package:flutter/material.dart';

import 'Configs/Colors.dart';

enum AppTheme {
  darkTheme,
  lightTheme
}

class AppThemes{
  static final appThemeData = {
    AppTheme.lightTheme : ThemeData(

      primaryColor: AppColors.primaryColor1,
      bottomAppBarColor:AppColors.secondaryColor2,
      splashColor: AppColors.primaryColor1,
      canvasColor:AppColors.secondaryColor4,

      scaffoldBackgroundColor: AppColors.primaryColor2,

      cardTheme: CardTheme(
          color: AppColors.secondaryColor1,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )
      ),
      iconTheme: const IconThemeData(
        color: AppColors.secondaryColor3
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
            color: AppColors.secondaryColor3
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.secondaryColor3
      ),

      textTheme: TextTheme(
        titleMedium: AppTextStyle.titleStyle(),
          headlineMedium: AppTextStyle.headerStyle(),
        bodyMedium: AppTextStyle.titleStyle().copyWith(color: AppColors.secondaryColor1)
      ),

    ),



    AppTheme.darkTheme : ThemeData(
      primaryColor: AppColors.secondaryColor3,
      scaffoldBackgroundColor: AppColors.grey,
      cardTheme: CardTheme(
          color: AppColors.secondaryColor3,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )
      ),
      iconTheme: const IconThemeData(
          color: AppColors.secondaryColor1
      ),
      listTileTheme: const ListTileThemeData(
          iconColor: AppColors.secondaryColor1
      ),
      textTheme: TextTheme(
        titleMedium: AppTextStyle.titleStyle().copyWith(color: AppColors.secondaryColor1),
          headlineMedium: AppTextStyle.headerStyle().copyWith(color: AppColors.secondaryColor3),
          bodyMedium: AppTextStyle.titleStyle().copyWith(color: AppColors.secondaryColor3)
      ),
    ),
  };
}