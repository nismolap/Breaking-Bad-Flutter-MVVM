import 'package:BreakingBad/Model/Repository/Characters_repos.dart';
import 'package:BreakingBad/presentation/Screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/bloc_exports.dart';

class AppRoutesGenerator{

  late CharactersCubit charactersCubit;
  AppRoutesGenerator(){charactersCubit = CharactersCubit(CharactersRepository());}
  Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (BuildContext context)=>CharactersCubit(CharactersRepository())..getAllCharacters(),child: const MyHomePage(),));
    }
  }
}
