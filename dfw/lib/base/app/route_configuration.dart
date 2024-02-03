import 'route_code.dart';

class SinglePageAppConfiguration {
  final String? path;
  final String? reglog;
  final bool unknown;

  SinglePageAppConfiguration.home({this.path})
      : unknown = false,
        reglog = null;

  SinglePageAppConfiguration.reglog({this.reglog})
      : unknown = false,
        path = null;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        path = null,
        reglog = null;

  bool get isUnknown => unknown == true;
  bool get isPage => unknown == false && reglog == null;
  bool get isReglog => unknown == false && path == null;
}
