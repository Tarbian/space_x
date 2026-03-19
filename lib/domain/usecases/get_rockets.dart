import 'package:space_x/domain/entities/rocket.dart';
import 'package:space_x/domain/repositories/spacex_repository.dart';

class GetRockets {
  final SpaceXRepository repository;
  GetRockets(this.repository);

  Future<List<Rocket>> call() async {
    return await repository.getRockets();
  }
}
