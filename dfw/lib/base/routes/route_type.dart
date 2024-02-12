import 'package:equatable/equatable.dart';

import 'package:The_Data_Fintastic_Whizbangerz_Group/base/routes/route_initial.dart';

class RouteType extends Equatable {
  final String path;
  final RouteSource? source;

  RouteType({required this.path, this.source});
  @override
  List<Object?> get props => [path, source];
}

enum RouteSource { fromScroll, fromClick, fromHover, fromAddress }
