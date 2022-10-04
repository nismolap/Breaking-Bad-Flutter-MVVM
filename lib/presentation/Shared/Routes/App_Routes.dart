import 'package:BreakingBad/presentation/Screens/home_screen.dart';
import 'package:BreakingBad/presentation/Screens/info_screen.dart';
import 'package:BreakingBad/presentation/Screens/search_screen.dart';
import 'package:BreakingBad/presentation/animation/transitions/slide_transition_route.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/bloc_exports.dart';

class AppRoutesGenerator{
  CharactersCubit charactersCubit = CharactersCubit();
  Route? onGenerateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(),);
      case '/search':
        return MaterialPageRoute(builder: (_) => BlocProvider.value(value: charactersCubit,child: SearchScreen(),));
      case '/info':
        InfoScreenArguments argument = args as InfoScreenArguments;
        return SlideTransitionRoute(settings:settings,page: BlocProvider.value(value: charactersCubit..getQuotesData(argument.index),child: InfoScreen(index: argument.index, img: argument.image, name: argument.name,),));
    }
    return null;
  }
}

class InfoScreenArguments{
  final int index;
  final String name;
  final String image;
  InfoScreenArguments({required this.index,required this.name,required this.image});
}
