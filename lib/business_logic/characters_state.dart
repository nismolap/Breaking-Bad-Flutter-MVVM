part of "characters_cubit.dart";

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState{
  final List<CharactersModel> characters;
  CharactersLoaded(this.characters);
}