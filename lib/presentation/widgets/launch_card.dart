import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x/core/app_constants.dart';
import 'package:space_x/domain/entities/launch.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchCard extends StatelessWidget {
  final Launch launch;

  const LaunchCard({super.key, required this.launch});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (launch.wikipedia != null) {
          final url = Uri.parse(launch.wikipedia!);
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppConstants.fill,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('dd/MM/yyyy').format(launch.dateUtc),
                      style: AppConstants.accentStyle()),
                  const SizedBox(height: 4),
                  Text(DateFormat('hh:mm a').format(launch.dateUtc),
                      style: AppConstants.captionStyle()),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(launch.missionName,
                      style: AppConstants.subtitleStyle(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(launch.siteName,
                      style: AppConstants.elementsStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
