import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:dio/dio.dart';

import '../../../../core/dio/nba_dio.dart';
import '../mapper/teams_mapper.dart';

class TeamDataSource {
  final NbaDio dio;
  TeamDataSource({
    required this.dio,
  });

  Future<List<Team>?> fetchTeams() async {
    try {
      List<Team> decodedTeams = [];
      final response = await dio.get("/teams");

      decodedTeams = (response.data["response"] as List)
          .map((e) => TeamsMapper.fromMap(e))
          .toList();
      return decodedTeams;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw ConnectionFailure(message: e.message);
      } else {
        print(e);
        throw ServerFailure(message: e.message);
      }
    } catch (e) {
      print(e);
      throw ServerFailure(message: e.toString());
    }
  }
}
