import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:space_x/data/datasources/spacex_remote_datasource.dart';
import 'package:space_x/data/repositories/spacex_repository_impl.dart';
import 'package:space_x/domain/repositories/spacex_repository.dart';
import 'package:space_x/domain/usecases/get_launches.dart';
import 'package:space_x/domain/usecases/get_rockets.dart';
import 'package:space_x/presentation/cubit/spacex_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory(() => SpaceXCubit(
        getRocketsUseCase: di(),
        getLaunchesUseCase: di(),
      ));

  di.registerLazySingleton(() => GetRockets(di()));
  di.registerLazySingleton(() => GetLaunches(di()));

  di.registerLazySingleton<SpaceXRepository>(
    () => SpaceXRepositoryImpl(remoteDataSource: di()),
  );

  di.registerLazySingleton<SpaceXRemoteDataSource>(
    () => SpaceXRemoteDataSourceImpl(client: di()),
  );

  di.registerLazySingleton(() => http.Client());
}
