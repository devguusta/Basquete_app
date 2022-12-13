import 'package:basquete_app/core/usecase/usecase.dart';
import 'package:basquete_app/modules/teams/domain/usecases/fetch_teams.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/teams_mocks.dart';
import '../repositories/teams_repository_test.mocks.dart';

void main() {
  late FetchTeams fetchTeamsUseCase;

  setUpAll(() {
    fetchTeamsUseCase = FetchTeams(MockTeamsRepository());
  });

  group("Tester fetch teams use case", () {
    test("Should return a list of teams when repository return Right",
        () async {
      when(fetchTeamsUseCase.teamsRepository.fetchTeams())
          .thenAnswer((_) async => Right(teams));
      final result = await fetchTeamsUseCase.call(NoParams());
      result.fold((l) => expect(l, null), (r) => expect(r, teams));
    });
    test("Should return a Failure error when repository return Left", () async {
      when(fetchTeamsUseCase.teamsRepository.fetchTeams())
          .thenAnswer((_) async => Left(failure));
      final result = await fetchTeamsUseCase.call(NoParams());
      result.fold((l) => expect(l, failure), (r) => expect(r, null));
    });
  });
}
