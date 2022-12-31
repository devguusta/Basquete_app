import 'package:basquete_app/core/usecase/usecase.dart';
import 'package:basquete_app/modules/teams/domain/repositories/team_repository.dart';
import 'package:basquete_app/modules/teams/domain/usecases/fetch_teams.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mock_teams.dart';
import 'fetch_teams_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TeamRepository>()])
void main() {
  late FetchTeams useCase;

  setUpAll(() {
    useCase = FetchTeams(MockTeamRepository());
  });

  group("Fetch Teams tests", () {
    test("Should return a list of Team when repository return Right", () async {
      when(useCase.repository.fetchTeams())
          .thenAnswer((_) async => Right(teams));
      final result = await useCase.call(NoParams());
      result.fold((l) => expect(l, null), (r) => expect(r, teams));
    });

    test("Should return a Failure when  repositor return Left", () async {
      when(useCase.repository.fetchTeams())
          .thenAnswer((_) async => Left(failure));
      final result = await useCase.call(NoParams());
      result.fold((l) => expect(l, failure), (r) => expect(r, null));
    });
  });
}
