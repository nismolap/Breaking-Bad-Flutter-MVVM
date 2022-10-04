import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  bool darkMode = false;
  DarkModeCubit() : super(DarkModeInitial());

  void changeSystemMode(){
    if(darkMode){
      darkMode = false;
      emit(DarkModeOff(darkMode: false));
    }else{
      darkMode = true;
      emit(DarkModeOn(darkMode: true));
    }
  }
}
