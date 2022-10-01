import 'package:BreakingBad/Model/Models/characters_model.dart';
import 'package:BreakingBad/Model/Repository/Characters_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<CharactersModel> characters =[];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void getAllCharacters(){
    charactersRepository.getAllCharacters().then((value) {
      characters = value ;
      emit(CharactersLoaded(characters));
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}