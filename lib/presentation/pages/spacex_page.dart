import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/app_constants.dart';
import 'package:space_x/core/di.dart';
import 'package:space_x/presentation/cubit/spacex_cubit.dart';
import 'package:space_x/presentation/cubit/spacex_state.dart';
import 'package:space_x/presentation/widgets/launch_card.dart';
import 'package:space_x/presentation/widgets/rocket_slider.dart';

class SpaceXPage extends StatelessWidget {
  const SpaceXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<SpaceXCubit>()..init(),
      child: Scaffold(
        backgroundColor: AppConstants.background,
        appBar: AppBar(
          backgroundColor: AppConstants.background,
          elevation: 0,
          title: Text("SpaceX Launches", style: AppConstants.titleStyle()),
          centerTitle: true,
        ),
        body: BlocBuilder<SpaceXCubit, SpaceXState>(
          builder: (context, state) {
            if (state.rockets.isEmpty && state.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: AppConstants.accent));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                RocketSlider(
                  rockets: state.rockets,
                  selectedIndex: state.selectedRocketIndex,
                  onPageChanged: (index) =>
                      context.read<SpaceXCubit>().selectRocket(index),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
                  child: Text(
                    "Missions",
                    style: TextStyle(
                        color: AppConstants.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: state.isLoading && state.launches.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: AppConstants.accent))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: state.launches.length,
                          itemBuilder: (context, index) {
                            return LaunchCard(launch: state.launches[index]);
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
