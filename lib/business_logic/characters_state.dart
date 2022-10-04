part of "characters_cubit.dart";

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState{
  final List<CharactersModel> characters;
  CharactersLoaded(this.characters);
}

class CharactersError extends CharactersState {}

class QuotesLoaded extends CharactersState{
  final List<QuotesModel> quotes;
  QuotesLoaded(this.quotes);
}
class QuotesLoading extends CharactersState{}

class QuotesError extends CharactersState{}

class SearchDataLoaded extends CharactersState{
  final List<CharactersModel> searchData;
  SearchDataLoaded(this.searchData);
}

class SearchDataEmpty extends CharactersState{}