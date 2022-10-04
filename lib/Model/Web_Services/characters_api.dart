import 'dart:convert';
import 'package:BreakingBad/Model/Web_Services/end_point.dart';
import 'package:http/http.dart' as http;

class CharactersApi {
  Future<List<dynamic>> fetchCharactersList() async {
    final response = await http
        .get(Uri.parse("${EndPoints.pathUrl}${EndPoints.characterPath}"));
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> getSelectedQuote({required int id}) async {
    final response = await http
        .get(Uri.parse("${EndPoints.pathUrl}${EndPoints.quotePath}$id"));
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> getCharacterByName({required String name}) async {
    final response = await http.get(Uri.parse(
        "${EndPoints.pathUrl}${EndPoints.characterPath}${EndPoints.characterName}$name"));
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> getCharacterCBetterCall() async {
    final response = await http.get(Uri.parse(
        "${EndPoints.pathUrl}${EndPoints.characterPath}${EndPoints.categoryBetterCallSaul}"));
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> getCharacterCBreakingBad() async {
    final response = await http.get(Uri.parse(
        "${EndPoints.pathUrl}${EndPoints.characterPath}${EndPoints.categoryBreakingBad}"));
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> getCharacterRandom() async {
    final response = await http.get(Uri.parse(
        "${EndPoints.pathUrl}${EndPoints.characterPath}${EndPoints.characterRandom}"));
    return jsonDecode(response.body);
  }
}
