class SinglePageAppConfiguration {
  final int? colorCode;
  final bool unknown;

  SinglePageAppConfiguration.home({int? colorCode})
      : unknown = false,
        colorCode = colorCode;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        colorCode = null;

  bool get isUnknown => unknown == true;
  bool get isHomePage => unknown == false;
}
