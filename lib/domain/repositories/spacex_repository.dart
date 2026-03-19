import 'package:space_x/domain/entities/launch.dart';
import 'package:space_x/domain/entities/rocket.dart';

abstract class SpaceXRepository {
  Future<List<Rocket>> getRockets();
  Future<List<Launch>> getLaunches(String rocketId);
}
