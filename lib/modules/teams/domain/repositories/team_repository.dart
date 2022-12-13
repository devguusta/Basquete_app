import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:dartz/dartz.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<Team>>> fetchTeams();
}
