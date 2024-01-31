import 'package:equatable/equatable.dart';

class RouteCode extends Equatable {
  final String pathCode;
  final RouteSelectionSource source;

  RouteCode({required this.pathCode, required this.source});

  @override
  List<Object?> get props => [pathCode, source];
}

enum RouteSelectionSource { fromScroll, fromButtonClick, fromBrowserAddressBar }
