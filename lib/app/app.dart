import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'breakingbadapi',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
