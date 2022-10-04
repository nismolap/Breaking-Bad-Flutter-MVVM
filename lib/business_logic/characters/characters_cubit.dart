import 'package:BreakingBad/Model/Models/characters_model.dart';
import 'package:BreakingBad/Model/Models/quotes_model.dart';
import 'package:BreakingBad/Model/Repository/Characters_repos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersRepository charactersRepository = CharactersRepository();

  CharactersCubit() : super(CharactersInitial());

  void getAllCharacters() {
    charactersRepository.getAllCharacters().then((value) {
      emit(CharactersLoaded(value));
    }).catchError((e){
      emit(CharactersError());
    });
  }

  void getQuotesData(int id) {
    emit(QuotesLoading());
    charactersRepository.getSelectedQuote(id: id).then((value) {
      value.isNotEmpty ? emit(QuotesLoaded(value)) : emit(QuotesError());
    });
  }

  void getCharacterByName(String name) {
    charactersRepository.getCharacterByName(name: name).then((value) {
      value.isEmpty || name.isEmpty ? emit(SearchDataEmpty()) : emit(SearchDataLoaded(value));
    });
  }

  void getCharacterCBetterCall() {
    charactersRepository.getCharacterCBetterCall().then((value) {
      emit(CharactersLoaded(value));
    });
  }

  void getCharacterCBreakingBad() {
    charactersRepository.getCharacterCBreakingBad().then((value) {
      emit(CharactersLoaded(value));
    });
  }

  void getCharacterRandom() {
    charactersRepository.getCharacterRandom().then((value) {
      emit(CharactersLoaded(value));
    }).catchError((e){
      emit(CharactersError());
    });
  }

}
