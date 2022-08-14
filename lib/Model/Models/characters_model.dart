class CharactersModel {
  int? charId;
  String? name;
  String? birthday;
  String? img;
  String? status;
  String? nickname;
  String? portrayed;
  String? category;

  CharactersModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
    category = json['category'];
  }
}
