class QuotesModel {
  int? quoteId;
  String? quote;
  String? author;
  String? series;

  QuotesModel.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }
}
