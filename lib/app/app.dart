import 'package:BreakingBad/presentation/Shared/Routes/App_Routes.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  final AppRoutesGenerator appRoute;
  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'breakingbadapi',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
