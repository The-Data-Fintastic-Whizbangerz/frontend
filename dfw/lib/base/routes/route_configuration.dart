class RouteConfiguration {
  final String? guestPath;
  final String? reglogPath;
  final bool unknown;

  RouteConfiguration.guest({this.guestPath})
      : unknown = false,
        reglogPath = null;

  RouteConfiguration.reglog({this.reglogPath})
      : unknown = false,
        guestPath = null;

  RouteConfiguration.unknown()
      : unknown = true,
        guestPath = null,
        reglogPath = null;

  bool get isUnknown => unknown == true;
  bool get isPage => unknown == false && reglogPath == null;
  bool get isReglog => unknown == false && guestPath == null;
}
