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
    final ValueNotifier<RouteType?> hoverNotifier = ValueNotifier(null);
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.width;
    return MultiValueListenableBuilder(
      valueListenables: [guestNotifier, reglogNotifier, hoverNotifier],
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
            bottom: false,
            minimum: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: (guests.length * 100) ~/ width,
                  child: SizedBox(
                    height: 60,
                    child: ListView.builder(
                      shrinkWrap: true,
                      // padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: guests.length,
                      itemBuilder: (context, index) {
                        return NavigationMenuButton(
                          path: guests[index],
                          selected: routeIndex == index &&
                              reglogNotifier.value == null,
                          hasSubMenu: hoverNotifier.value?.path == 'products',
                          onPressed: () {
                            guestNotifier.value = RouteType(
                              path: guests[index],
                              source: RouteSelectionSource.fromButtonClick,
                            );
                            reglogNotifier.value = null;
                          },
                          onHover: (value) {
                            hoverNotifier.value = RouteType(
                              path: guests[index],
                              source: RouteSelectionSource.fromButtonHover,
                            );
                          },
                          itemBuilder: (BuildContext) {
                            if (hoverNotifier.value?.path == 'products') {
                              return [
                                PopupMenuItem(
                                  child: Text('Borrowing calculator'),
                                  onTap: () {
                                    guestNotifier.value = RouteType(
                                      path:
                                          '${guests[index]}/borrowing-calculator',
                                      source:
                                          RouteSelectionSource.fromButtonClick,
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text('Repayment calculator'),
                                ),
                                PopupMenuItem(
                                  child: Text('Loan recommender'),
                                ),
                                PopupMenuItem(child: Text('Test')),
                              ];
                            }
                            return [];
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: (reglog.length * 100) ~/ width,
                  child: SizedBox(
                    height: 60,
                    child: NavigationMenuButton(
                      path: 'login',
                      selected: reglogNotifier.value?.path == 'login',
                      hasSubMenu: false,
                      onPressed: () {
                        guestNotifier.value = null;
                        reglogNotifier.value = RouteType(
                          path: 'login',
                          source: RouteSelectionSource.fromButtonClick,
                        );
                      },
                      itemBuilder: (BuildContext) {
                        return [];
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
