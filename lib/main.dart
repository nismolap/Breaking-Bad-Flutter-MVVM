import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm2/View/Screens/home_screen.dart';

void main() => runApp(const MyApp());

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
