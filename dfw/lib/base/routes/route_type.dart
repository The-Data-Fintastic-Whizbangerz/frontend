import 'package:equatable/equatable.dart';

class RouteType extends Equatable {
  final String path;
  final RouteSelectionSource source;

  const RouteType({required this.path, required this.source});

  @override
  List<Object?> get props => [path, source];
}

enum RouteSelectionSource { fromScroll, fromButtonClick, fromBrowserAddressBar }
