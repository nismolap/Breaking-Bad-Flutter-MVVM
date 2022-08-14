import 'package:mvvm2/Model/Models/characters_model.dart';
import 'package:mvvm2/Model/Models/quotes_model.dart';
import 'package:mvvm2/Model/Web_Services/characters_api.dart';

class CharactersRepository {
  Future<List<CharactersModel>> getAllCharacters() async {
    final response = await CharactersApi().fetchCharactersList();
    return response.map((data) => CharactersModel.fromJson(data)).toList();
  }

  Future<List<QuotesModel>> getSelectedQuote({required int id}) async {
    final response = await CharactersApi().getSelectedQute(id: id);
    return response.map((data) => QuotesModel.fromJson(data)).toList();
  }
}
