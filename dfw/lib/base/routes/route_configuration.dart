class RouteConfiguration {
  final String? guestPath;
  final String? extraPath;
  final String? reglogPath;
  final bool unknown;

  RouteConfiguration.guest({this.guestPath})
      : unknown = false,
        extraPath = null,
        reglogPath = null;

  RouteConfiguration.reglog({this.reglogPath})
      : unknown = false,
        extraPath = null,
        guestPath = null;

  RouteConfiguration.product({this.guestPath, this.extraPath})
      : unknown = false,
        reglogPath = null;

  RouteConfiguration.unknown()
      : unknown = true,
        guestPath = null,
        extraPath = null,
        reglogPath = null;

  bool get isUnknown => unknown == true;
  bool get isPage =>
      unknown == false && reglogPath == null && extraPath == null;
  bool get isProductsPage =>
      unknown == false && reglogPath == null && guestPath == null;
  bool get isReglog => unknown == false && guestPath == null;
}
