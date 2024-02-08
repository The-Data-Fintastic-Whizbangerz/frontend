class RouteConfiguration {
  final String? guestPath;
  final String? productPath;
  final String? reglogPath;
  final bool unknown;

  RouteConfiguration.guest({this.guestPath})
      : unknown = false,
        productPath = null,
        reglogPath = null;

  RouteConfiguration.reglog({this.reglogPath})
      : unknown = false,
        productPath = null,
        guestPath = null;

  RouteConfiguration.product({this.productPath})
      : unknown = false,
        guestPath = 'products',
        reglogPath = null;

  RouteConfiguration.unknown()
      : unknown = true,
        guestPath = null,
        productPath = null,
        reglogPath = null;

  bool get isUnknown => unknown == true;
  bool get isPage =>
      unknown == false && reglogPath == null && productPath == null;
  bool get isProductsPage =>
      unknown == false && reglogPath == null && guestPath == 'products';
  bool get isReglog =>
      unknown == false && guestPath == null && reglogPath != null;
}
