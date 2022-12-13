import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/core/usecase/usecase.dart';
import 'package:basquete_app/modules/teams/domain/entities/teams.dart';
import 'package:basquete_app/modules/teams/domain/repositories/teams_repository.dart';
import 'package:dartz/dartz.dart';

class FetchTeams implements UseCase<List<Teams>, NoParams> {
  final TeamsRepository teamsRepository;

  FetchTeams(this.teamsRepository);
  @override
  Future<Either<Failure, List<Teams>>> call(NoParams params) async {
    return await teamsRepository.fetchTeams();
  }
}
