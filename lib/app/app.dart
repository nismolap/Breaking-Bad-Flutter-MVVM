import 'package:BreakingBad/business_logic/bloc_exports.dart';
import 'package:BreakingBad/business_logic/dark_mode/dark_mode_cubit.dart';
import 'package:BreakingBad/presentation/Shared/Routes/App_Routes.dart';
import 'package:BreakingBad/presentation/Shared/app_theme.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  final AppRoutesGenerator appRoute;

  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>DarkModeCubit()),
        BlocProvider.value(value: CharactersCubit()..getAllCharacters()),
      ],
      child: BlocBuilder<DarkModeCubit, DarkModeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'breakingbadapi',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRoute.onGenerateRoute,
            initialRoute: '/',
            theme: state is DarkModeOn ?
            AppThemes.appThemeData[AppTheme.darkTheme]
                : state is DarkModeOff ?
            AppThemes.appThemeData[AppTheme.lightTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme]
          );
        },
      ),
    );
  }
}
