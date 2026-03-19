import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:space_x/data/models/launch_model.dart';
import 'package:space_x/data/models/rocket_model.dart';

abstract class SpaceXRemoteDataSource {
  Future<List<RocketModel>> getRockets();
  Future<List<LaunchModel>> getLaunches(String rocketId);
}

class SpaceXRemoteDataSourceImpl implements SpaceXRemoteDataSource {
  final http.Client client;
  SpaceXRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RocketModel>> getRockets() async {
    final response =
        await client.get(Uri.parse('https://api.spacexdata.com/v3/rockets'));
    if (response.statusCode == 200) {
      final List decoded = jsonDecode(response.body);
      return decoded.map((item) => RocketModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load rockets');
    }
  }

  @override
  Future<List<LaunchModel>> getLaunches(String rocketId) async {
    final response = await client.get(
      Uri.parse('https://api.spacexdata.com/v3/launches?rocket_id=$rocketId'),
    );
    if (response.statusCode == 200) {
      final List decoded = jsonDecode(response.body);
      return decoded.map((item) => LaunchModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load launches');
    }
  }
}
