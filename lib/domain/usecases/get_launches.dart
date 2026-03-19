import 'package:space_x/domain/entities/launch.dart';
import 'package:space_x/domain/repositories/spacex_repository.dart';

class GetLaunches {
  final SpaceXRepository repository;
  GetLaunches(this.repository);

  Future<List<Launch>> call(String rocketId) async {
    return await repository.getLaunches(rocketId);
  }
}
