import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/core/usecase/usecase.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:basquete_app/modules/teams/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class FetchTeams implements UseCase<List<Team>, NoParams> {
  final TeamRepository repository;

  FetchTeams(this.repository);
  @override
  Future<Either<Failure, List<Team>>> call(NoParams params) async {
    return await repository.fetchTeams();
  }
}
