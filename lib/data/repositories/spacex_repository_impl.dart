import 'package:space_x/data/datasources/spacex_remote_datasource.dart';
import 'package:space_x/domain/entities/launch.dart';
import 'package:space_x/domain/entities/rocket.dart';
import 'package:space_x/domain/repositories/spacex_repository.dart';

class SpaceXRepositoryImpl implements SpaceXRepository {
  final SpaceXRemoteDataSource remoteDataSource;

  SpaceXRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Rocket>> getRockets() async {
    return await remoteDataSource.getRockets();
  }

  @override
  Future<List<Launch>> getLaunches(String rocketId) async {
    return await remoteDataSource.getLaunches(rocketId);
  }
}
