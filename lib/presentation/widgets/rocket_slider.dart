import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:space_x/domain/entities/rocket.dart';

class RocketSlider extends StatelessWidget {
  final List<Rocket> rockets;
  final int selectedIndex;
  final Function(int) onPageChanged;

  const RocketSlider({
    super.key,
    required this.rockets,
    required this.selectedIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.78,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) => onPageChanged(index),
          ),
          items: rockets.map((rocket) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                rocket.flickrImages.first,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey, child: const Icon(Icons.rocket_launch)),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(rockets.length, (index) {
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    selectedIndex == index ? Colors.white : Colors.transparent,
                border: Border.all(color: Colors.white),
              ),
            );
          }),
        ),
      ],
    );
  }
}
