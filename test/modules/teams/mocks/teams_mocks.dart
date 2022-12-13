import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/teams.dart';
import 'package:faker/faker.dart';

List<Teams> teams = [
  Teams(
    id: 1,
    name: "Golden State Warriors",
    nickName: "warriors",
    code: "gsw",
    city: Faker().address.city(),
    imageUrl: Faker().image.image(),
  ),
  Teams(
    id: 2,
    name: "Los Angeles Lakers",
    nickName: "Lakers",
    code: "lakers",
    city: Faker().address.city(),
    imageUrl: Faker().image.image(),
  )
];
Failure failure = ServerFailure(message: "Sistema indisponível");
