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
  bool get isPage =>
      unknown == false &&
      reglogPath == null &&
      guestPath?.split('/').length == 1;
  bool get isProductsPage =>
      unknown == false &&
      reglogPath == null &&
      guestPath?.split('/').length != 1 &&
      guestPath?.split('/')[0] == 'products';
  bool get isGuidesPage =>
      unknown == false && reglogPath == null && guestPath == 'guides';
  bool get isReglog =>
      unknown == false && guestPath == null && reglogPath != null;
}
