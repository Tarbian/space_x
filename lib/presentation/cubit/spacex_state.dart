import 'package:equatable/equatable.dart';
import 'package:space_x/domain/entities/launch.dart';
import 'package:space_x/domain/entities/rocket.dart';

class SpaceXState extends Equatable {
  final bool isLoading;
  final List<Rocket> rockets;
  final List<Launch> launches;
  final int selectedRocketIndex;
  final String? error;

  const SpaceXState({
    this.isLoading = false,
    this.rockets = const [],
    this.launches = const [],
    this.selectedRocketIndex = 0,
    this.error,
  });

  SpaceXState copyWith({
    bool? isLoading,
    List<Rocket>? rockets,
    List<Launch>? launches,
    int? selectedRocketIndex,
    String? error,
  }) {
    return SpaceXState(
      isLoading: isLoading ?? this.isLoading,
      rockets: rockets ?? this.rockets,
      launches: launches ?? this.launches,
      selectedRocketIndex: selectedRocketIndex ?? this.selectedRocketIndex,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, rockets, launches, selectedRocketIndex, error];
}
