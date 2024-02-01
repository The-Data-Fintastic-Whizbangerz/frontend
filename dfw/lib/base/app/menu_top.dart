import 'package:flutter/material.dart';
import 'menu_button.dart';
import 'route_code.dart';

class TopNavigationMenu extends StatelessWidget {
  final List<String> routes;
  final ValueNotifier<RouteCode?> routeNotifier;
  const TopNavigationMenu({
    Key? key,
    required this.routes,
    required this.routeNotifier,
  }) : super(key: key);

  int get routeIndex {
    final selectedRouteCode = routeNotifier.value?.pathCode;
    int index = routes.indexWhere((element) => element == selectedRouteCode);
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: routeNotifier,
      builder: (BuildContext context, RouteCode? value, Widget? child) {
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
                    routeNotifier.value = RouteCode(
                      pathCode: routes[i],
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
