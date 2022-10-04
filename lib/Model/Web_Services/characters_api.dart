import 'dart:convert';
import 'package:BreakingBad/Model/Web_Services/end_point.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:BreakingBad/Model/exception.dart';

class CharactersApi {

  Future<List<dynamic>> fetchCharactersList() async {
    List<dynamic> responseJson;
      final response = await http.get(Uri.parse("${EndPoints.pathUrl}${EndPoints.characterPath}"));
      responseJson = returnResponse(response);
      return responseJson;
  }

  Future<List<dynamic>> getSelectedQuote({required int id}) async {
    List<dynamic> responseJson;
      final response = await http.get(Uri.parse("${EndPoints.pathUrl}${EndPoints.quotePath}$id"));
      responseJson = returnResponse(response);
      return responseJson;
  }

  Future<List<dynamic>> getCharacterByName({required String name}) async {
    List<dynamic> responseJson;
      final response = await http.get(Uri.parse("${EndPoints.pathUrl}${EndPoints.characterPath}?name=$name"));
      responseJson = returnResponse(response);
      return responseJson;
  }

  Future<List<dynamic>> getCharacterCBetterCall() async {
    List<dynamic> responseJson;
    final response = await http.get(Uri.parse("${EndPoints.pathUrl}${EndPoints.characterPath}?category=Better+Call+Saul"));
    responseJson = returnResponse(response);
    return responseJson;
  }
  Future<List<dynamic>> getCharacterCBreakingBad() async {
    List<dynamic> responseJson;
    final response = await http.get(Uri.parse("${EndPoints.pathUrl}${EndPoints.characterPath}?category=Breaking+Bad"));
    responseJson = returnResponse(response);
    return responseJson;
  }
  Future<List<dynamic>> getCharacterRandom() async {
    List<dynamic> responseJson;
    final response = await http.get(Uri.parse("${EndPoints.pathUrl}${EndPoints.characterPath}/random"));
    responseJson = returnResponse(response);
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }
}
