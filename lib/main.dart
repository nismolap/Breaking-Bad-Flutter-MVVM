import 'package:BreakingBad/presentation/Shared/Routes/App_Routes.dart';
import 'package:BreakingBad/business_logic/bloc_observ.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRoute: AppRoutesGenerator(),
  ));
}
