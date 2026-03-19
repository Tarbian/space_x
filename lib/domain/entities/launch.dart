class Launch {
  final String missionName;
  final String siteName;
  final DateTime dateUtc;
  final String? wikipedia;

  Launch(
      {required this.missionName,
      required this.siteName,
      required this.dateUtc,
      this.wikipedia});
}
