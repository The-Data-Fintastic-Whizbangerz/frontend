import 'route_code.dart';

class SinglePageAppConfiguration {
  final String? path;
  final bool unknown;

  SinglePageAppConfiguration.home({String? path})
      : unknown = false,
        path = path;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        path = null;

  bool get isUnknown => unknown == true;
  bool get isPage => unknown == false;
}
