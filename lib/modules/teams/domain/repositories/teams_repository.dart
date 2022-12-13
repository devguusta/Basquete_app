import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/teams.dart';
import 'package:dartz/dartz.dart';

abstract class TeamsRepository {
  Future<Either<Failure, List<Teams>>> fetchTeams();
}
