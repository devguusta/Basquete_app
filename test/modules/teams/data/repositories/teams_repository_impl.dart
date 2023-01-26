import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:basquete_app/modules/teams/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/team_datasource.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamDataSource dataSource;
  TeamRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<Team>>> fetchTeams() async {
    try {
      final result = await dataSource.fetchTeams();
      if (result == null || result.isEmpty) {
        return Left(ServerFailure(
            message: "Não foi possível buscar os times no momento"));
      }
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
