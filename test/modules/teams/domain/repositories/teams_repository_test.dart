import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/repositories/teams_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/teams_mocks.dart';
import 'teams_repository_test.mocks.dart';

@GenerateMocks([TeamsRepository])
void main() {
  late TeamsRepository repository;

  setUp(() {
    repository = MockTeamsRepository();
  });

  group("Tester teams repository", () {
    test("Should return a list of Teams when fetchTeams return Right ",
        () async {
      when(repository.fetchTeams()).thenAnswer((_) async => Right(teams));
      final result = await repository.fetchTeams();
      result.fold((l) => expect(l, null), (r) => expect(r, teams));
    });
    test("Should return Server failure when fetchTeams return Left", () async {
      when(repository.fetchTeams()).thenAnswer((_) async => Left(failure));
      final result = await repository.fetchTeams();
      result.fold((l) => expect(l, isInstanceOf<ServerFailure>()),
          (r) => expect(r, null));
    });
  });
}
