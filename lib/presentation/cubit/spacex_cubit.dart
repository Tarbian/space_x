import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/domain/usecases/get_launches.dart';
import 'package:space_x/domain/usecases/get_rockets.dart';

import 'spacex_state.dart';

class SpaceXCubit extends Cubit<SpaceXState> {
  final GetRockets getRocketsUseCase;
  final GetLaunches getLaunchesUseCase;

  SpaceXCubit({
    required this.getRocketsUseCase,
    required this.getLaunchesUseCase,
  }) : super(const SpaceXState());

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    try {
      final rockets = await getRocketsUseCase();
      emit(state.copyWith(rockets: rockets));
      if (rockets.isNotEmpty) {
        await selectRocket(0);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectRocket(int index) async {
    emit(state.copyWith(isLoading: true, selectedRocketIndex: index));
    try {
      final rocketId = state.rockets[index].id;
      final launches = await getLaunchesUseCase(rocketId);
      emit(state.copyWith(isLoading: false, launches: launches));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
