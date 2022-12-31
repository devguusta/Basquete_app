import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:basquete_app/modules/teams/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mock_teams.dart';
import '../usecases/fetch_teams_test.mocks.dart';

void main() {
  late TeamRepository repository;

  setUpAll(() {
    repository = MockTeamRepository();
  });

  group("Tests Team repository", () {
    test("Should return list of Team when fetchTeams return Right", () async {
      when(repository.fetchTeams()).thenAnswer((_) async => Right(teams));
      final result = await repository.fetchTeams();
      expect(result.fold((l) => l, (r) => r), isInstanceOf<List<Team>>());
    });

    test("Should return a Failure when  fetchTeams return Left", () async {
      when(repository.fetchTeams()).thenAnswer((_) async => Left(failure));
      final result = await repository.fetchTeams();
      result.fold((l) {
        expect(l, isInstanceOf<ServerFailure>());
        expect(l.message, "Ocorreu um erro no sistema");
      }, (r) => expect(r, null));
    });
  });
}
