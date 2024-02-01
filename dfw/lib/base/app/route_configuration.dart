import 'route_code.dart';

class SinglePageAppConfiguration {
  final String? path;
  final bool unknown;

  SinglePageAppConfiguration.home({this.path}) : unknown = false;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        path = null;

  bool get isUnknown => unknown == true;
  bool get isPage => unknown == false;
}
