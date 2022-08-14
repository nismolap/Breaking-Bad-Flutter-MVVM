// ignore_for_file: must_call_super

import 'package:BreakingBad/Model/Repository/Characters_repos.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:BreakingBad/Model/Models/characters_model.dart';
import 'package:BreakingBad/Model/Models/quotes_model.dart';

class HomeController extends GetxController {
  List<QuotesModel> quotes = [];

  List<CharactersModel> characters = [];

  RxBool loading = false.obs;
  RxBool loadingQuotes = false.obs;

  @override
  void onInit() {
    getCharactersData();
  }

  void getCharactersData() {
    CharactersRepository().getAllCharacters().then((value) {
      characters = value;
      loading.value = true;
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  void getQuotesData(int id) {
    loadingQuotes.value = false;
    CharactersRepository().getSelectedQuote(id: id).then((value) {
      quotes = value;
      loadingQuotes.value = true;
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }
}
