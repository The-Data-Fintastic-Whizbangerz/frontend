import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import 'menu_button.dart';
import 'route_code.dart';

class TopNavigationMenu extends StatelessWidget {
  final List<String> routes;
  final ValueNotifier<RouteCode?> routeNotifier;
  final List<String> reglog;
  final ValueNotifier<RouteCode?> reglogNotifier;
  const TopNavigationMenu({
    Key? key,
    required this.routes,
    required this.routeNotifier,
    required this.reglog,
    required this.reglogNotifier,
  }) : super(key: key);

  int get routeIndex {
    final selectedRouteCode = routeNotifier.value?.pathCode;
    int index = routes.indexWhere((element) => element == selectedRouteCode);
    return index > -1 ? index : -1;
  }

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
      valueListenables: [routeNotifier, reglogNotifier],
      builder: (context, values, child) {
        return Container(
          color: Colors.black87,
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              for (int i = 0; i < routes.length; i++)
                NavigationMenuButton(
                  path: routes[i],
                  selected: routeIndex == i,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  onPressed: () {
                    reglogNotifier.value = null;
                    routeNotifier.value = RouteCode(
                      pathCode: routes[i],
                      source: RouteSelectionSource.fromButtonClick,
                    );
                  },
                ),
              NavigationMenuButton(
                path: 'signin',
                selected: reglogNotifier.value != null,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                onPressed: () {
                  routeNotifier.value = null;
                  reglogNotifier.value = RouteCode(
                    pathCode: 'signin',
                    source: RouteSelectionSource.fromButtonClick,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
