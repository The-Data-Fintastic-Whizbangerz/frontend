import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import '../extensions/themes.dart';
import '../routes/route_type.dart';
import 'menu_button.dart';

class TopNavigationMenu extends StatelessWidget {
  final List<String> guests;
  final ValueNotifier<RouteType?> guestNotifier;
  final List<String> reglog;
  final ValueNotifier<RouteType?> reglogNotifier;
  const TopNavigationMenu({
    Key? key,
    required this.guests,
    required this.guestNotifier,
    required this.reglog,
    required this.reglogNotifier,
  }) : super(key: key);

  int get routeIndex {
    final selectedRouteCode = guestNotifier.value?.path;
    int index = guests.indexWhere((element) => element == selectedRouteCode);
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MultiValueListenableBuilder(
      valueListenables: [guestNotifier, reglogNotifier],
      builder: (context, values, child) {
        return Container(
          width: width,
          decoration: routeIndex == 0
              ? BoxDecoration(color: Colors.white10)
              : BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      BasicTheme.leftBackground,
                      BasicTheme.rightBackground,
                      BasicTheme.leftBackground,
                      BasicTheme.rightBackground,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.3, 0.8, 1],
                  ),
                ),
          child: SafeArea(
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: [
                for (int i = 0; i < guests.length; i++)
                  NavigationMenuButton(
                    path: guests[i],
                    selected: routeIndex == i && reglogNotifier.value == null,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    onPressed: () {
                      guestNotifier.value = RouteType(
                        path: guests[i],
                        source: RouteSelectionSource.fromButtonClick,
                      );
                      reglogNotifier.value = null;
                    },
                  ),
                NavigationMenuButton(
                  path: 'login',
                  selected: reglogNotifier.value != null &&
                      guestNotifier.value == null,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  onPressed: () {
                    guestNotifier.value = null;
                    reglogNotifier.value = RouteType(
                      path: 'login',
                      source: RouteSelectionSource.fromButtonClick,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
