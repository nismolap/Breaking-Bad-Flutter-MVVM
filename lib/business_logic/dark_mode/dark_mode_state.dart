part of 'dark_mode_cubit.dart';

@immutable
abstract class DarkModeState {}

class DarkModeInitial extends DarkModeState {}

class DarkModeOn extends DarkModeState {
  final bool darkMode;
  DarkModeOn({required this.darkMode});
}

class DarkModeOff extends DarkModeState {
  final bool darkMode;
  DarkModeOff({required this.darkMode});
}
