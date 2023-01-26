import 'package:basquete_app/modules/teams/domain/entities/team.dart';

class TeamsMapper {
  static Team fromMap(Map<String, dynamic> map) {
    return Team(
        id: map['id'].toInt() ?? "",
        name: map["name"] ?? "",
        nickName: map["nickname"] ?? "",
        code: map["code"] ?? "",
        city: map["city"] ?? "",
        imageUrl: map["logo"] ?? "");
  }
}
