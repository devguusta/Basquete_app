import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:basquete_app/modules/teams/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasource/teams_datasource.dart';

class TeamsRepositoryImpl implements TeamRepository {
  final TeamsDataSource dataSource;
  TeamsRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<Team>>> fetchTeams() async {
    try {
      final result = await dataSource.fetchTeams();
      if (result == null || result.isEmpty) {
        return Left(
            ServerFailure(message: "Nenhum time encontrado. Tente novamente"));
      }
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
