class CharactersModel {
  int? charId;
  String? name;
  String? birthday;
  String? img;
  String? status;
  String? nickname;
  String? portrayed;
  String? category;

  CharactersModel({
    this.charId,
    this.name,
    this.birthday,
    this.img,
    this.status,
    this.nickname,
    this.portrayed,
    this.category,
  });

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['img'] = this.img;
    data['status'] = this.status;
    data['nickname'] = this.nickname;
    data['portrayed'] = this.portrayed;
    data['category'] = this.category;
    return data;
  }
}
