import 'package:space_x/domain/entities/rocket.dart';

class RocketModel extends Rocket {
  RocketModel({
    required super.id,
    required super.name,
    required super.flickrImages,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      id: json['rocket_id'],
      name: json['rocket_name'],
      flickrImages: List<String>.from(json['flickr_images']),
    );
  }
}
