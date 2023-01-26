import 'package:basquete_app/core/dio/nba_dio.dart';
import 'package:basquete_app/core/error/failure.dart';
import 'package:basquete_app/modules/teams/domain/entities/team.dart';
import 'package:dio/dio.dart';

import '../mapper/teams_mapper.dart';

class TeamsDataSource {
  final NbaDio dio;
  TeamsDataSource({
    required this.dio,
  });
  Future<List<Team>?> fetchTeams() async {
    try {
      List<Team> teams = [];
      final response = await dio.get("/teams");
      teams = (response.data["response"] as List)
          .map((e) => TeamsMapper.fromMap(e))
          .toList();
      return teams;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw ConnectionFailure(message: e.message);
      } else {
        throw ServerFailure(message: e.message);
      }
    } catch (e) {
      print(e);
      throw ServerFailure(message: e.toString());
    }
  }
}
