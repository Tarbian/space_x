import 'package:space_x/domain/entities/launch.dart';

class LaunchModel extends Launch {
  LaunchModel({
    required super.missionName,
    required super.siteName,
    required super.dateUtc,
    super.wikipedia,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      missionName: json['mission_name'],
      siteName: json['launch_site']['site_name_long'],
      dateUtc: DateTime.parse(json['launch_date_utc']),
      wikipedia: json['links']['wikipedia'],
    );
  }
}
