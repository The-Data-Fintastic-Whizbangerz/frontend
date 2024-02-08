import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RouteInitial extends Equatable {
  String path;
  RouteCategory category;
  Widget? widget;
  Page? page;

  RouteInitial(
    this.path,
    this.category,
    this.widget,
    this.page,
  );

  @override
  List<Object?> get props {
    return [
      path,
      category,
      widget,
      page,
    ];
  }

  List<RouteFloor> get floor {
    return category.item.values.single;
  }
}

enum RouteRule {
  public,
  protected,
  private,
}

enum RouteCategory {
  home({
    RouteRule.public: [RouteFloor.first]
  }),
  products({
    RouteRule.public: [RouteFloor.first, RouteFloor.second]
  }),
  guides({
    RouteRule.public: [RouteFloor.first]
  }),
  news({
    RouteRule.public: [RouteFloor.first]
  }),
  about({
    RouteRule.public: [RouteFloor.first]
  }),
  contact({
    RouteRule.public: [RouteFloor.first]
  }),
  login({
    RouteRule.protected: [RouteFloor.first]
  }),
  register({
    RouteRule.protected: [RouteFloor.first]
  }),
  dashboard({
    RouteRule.private: [RouteFloor.first]
  });

  final Map<RouteRule, List<RouteFloor>> item;

  const RouteCategory(this.item);
}

enum RouteFloor {
  ground,
  first,
  second,
  third,
}
