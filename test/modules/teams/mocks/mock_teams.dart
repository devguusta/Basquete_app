import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:faker/faker.dart';

List<Team> teams = [
  Team(
      id: 1,
      name: "Golden State Warriors",
      nickName: "warriors",
      code: "gsw",
      city: "Los Angeles",
      imageUrl: Faker().image.image()),
  Team(
      id: 2,
      name: "Los Angeles Lakers",
      nickName: "lakers",
      code: "lakers",
      city: "Los Angeles",
      imageUrl: Faker().image.image())
];
var failure = ServerFailure(message: "Ocorreu um erro no sistema");
