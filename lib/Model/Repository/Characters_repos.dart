import 'package:BreakingBad/Model/Models/characters_model.dart';
import 'package:BreakingBad/Model/Models/quotes_model.dart';
import 'package:BreakingBad/Model/Web_Services/characters_api.dart';

class CharactersRepository {
  Future<List<CharactersModel>> getAllCharacters() async {
    final response = await CharactersApi().fetchCharactersList();
    return response.map((data) => CharactersModel.fromJson(data)).toList();
  }

  Future<List<QuotesModel>> getSelectedQuote({required int id}) async {
    final response = await CharactersApi().getSelectedQuote(id: id);
    return response.map((data) => QuotesModel.fromJson(data)).toList();
  }

  Future<List<CharactersModel>> getCharacterByName({required String name}) async {
    final response = await CharactersApi().getCharacterByName(name: name);
    return response.map((data) => CharactersModel.fromJson(data)).toList();
  }
  Future<List<CharactersModel>> getCharacterCBetterCall() async {
    final response = await CharactersApi().getCharacterCBetterCall();
    return response.map((data) => CharactersModel.fromJson(data)).toList();
  }
  Future<List<CharactersModel>> getCharacterCBreakingBad() async {
    final response = await CharactersApi().getCharacterCBreakingBad();
    return response.map((data) => CharactersModel.fromJson(data)).toList();
  }
  Future<List<CharactersModel>> getCharacterRandom() async {
    final response = await CharactersApi().getCharacterRandom();
    return response.map((data) => CharactersModel.fromJson(data)).toList();
  }
}
