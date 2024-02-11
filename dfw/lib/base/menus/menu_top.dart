import 'package:The_Data_Fintastic_Whizbangerz_Group/base/routes/route_initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import '../extensions/themes.dart';
import '../routes/route_bloc.dart';
import '../routes/route_type.dart';
import 'menu_button.dart';

class TopNavigationMenu extends StatefulWidget {
  final ValueNotifier<RouteType?> guestNotifier;
  final ValueNotifier<RouteType?> productNotifier;
  final ValueNotifier<RouteType?> reglogNotifier;
  const TopNavigationMenu({
    Key? key,
    required this.guestNotifier,
    required this.productNotifier,
    required this.reglogNotifier,
  }) : super(key: key);

  @override
  State<TopNavigationMenu> createState() => _TopNavigationMenuState();
}

class _TopNavigationMenuState extends State<TopNavigationMenu> {
  @override
  void initState() {
    super.initState();
  }

  // int get routeIndex {
  //   final selectedRouteCode = widget.guestNotifier.value?.path;
  //   int index =
  //       widget.guests.indexWhere((element) => element == selectedRouteCode);
  //   return index > -1 ? index : 0;
  // }

  List<RouteType> test_guests = [];
  List<RouteType> test_reglog = [];
  int getCurrent(List<RouteType> s1, RouteType? s2) {
    int index = s1.indexWhere((element) => element.path == s2?.path);
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<RouteType?> hoverNotifier = ValueNotifier(null);
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<RouteBloc, RouteState>(
      listener: (context, state) {
        if (state is Guest_RouteState) {
          test_guests = state.routes.map((e) => e.type).toList();
        }
        if (state is Reglog_RouteState) {
          test_reglog = state.routes.map((e) => e.type).toList();
        }
      },
      builder: (context, state) {
        return MultiValueListenableBuilder(
          valueListenables: [
            widget.guestNotifier,
            widget.reglogNotifier,
            hoverNotifier,
            widget.productNotifier
          ],
          builder: (context, values, child) {
            return Container(
              width: width,
              decoration:
                  getCurrent(test_guests, widget.guestNotifier.value) == 0
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
                      flex: (test_guests.length * 100) ~/ width,
                      child: SizedBox(
                        height: 60,
                        child: ListView.builder(
                          shrinkWrap: true,
                          // padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: test_guests.length,
                          itemBuilder: (context, index) {
                            // print(test_current.indexWhere((element) =>
                            //     element == widget.guestNotifier.value?.path));
                            return NavigationMenuButton(
                              path: test_guests[index].path,
                              selected: getCurrent(test_guests,
                                          widget.guestNotifier.value) ==
                                      index &&
                                  widget.reglogNotifier.value == null &&
                                  widget.productNotifier.value == null,
                              hasSubMenu:
                                  hoverNotifier.value?.path == 'products',
                              onPressed: () {
                                widget.guestNotifier.value = RouteType(
                                  path: test_guests[index].path,
                                  source: RouteSource.fromClick,
                                );
                                hoverNotifier.value = null;
                                widget.reglogNotifier.value = null;
                                widget.productNotifier.value = null;
                                // print(getCurrent(
                                //     test_current, selectedRouteCode));
                              },
                              onHover: (value) {
                                widget.guestNotifier.value = RouteType(
                                  path: test_guests[index].path,
                                  source: RouteSource.fromHover,
                                );
                                hoverNotifier.value = RouteType(
                                  path: test_guests[index].path,
                                  source: RouteSource.fromHover,
                                );
                                widget.reglogNotifier.value = null;
                              },
                              itemBuilder: (context) {
                                if (hoverNotifier.value?.path == 'products') {
                                  return [
                                    PopupMenuItem(
                                      child: Text('Borrowing calculator'),
                                      onTap: () {
                                        widget.productNotifier.value =
                                            RouteType(
                                          path: 'borrowing-calculator',
                                          source: RouteSource.fromClick,
                                        );
                                        hoverNotifier.value = null;
                                        widget.guestNotifier.value = null;
                                        widget.reglogNotifier.value = null;
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
                      flex: (test_reglog.length * 100) ~/ width,
                      child: SizedBox(
                        height: 60,
                        child: NavigationMenuButton(
                          path: 'login',
                          selected:
                              widget.reglogNotifier.value?.path == 'login',
                          hasSubMenu: false,
                          onPressed: () {
                            widget.guestNotifier.value = null;
                            widget.reglogNotifier.value = RouteType(
                              path: 'login',
                              source: RouteSource.fromClick,
                            );
                          },
                          onHover: (value) {
                            hoverNotifier.value = RouteType(
                              path: 'login',
                              source: RouteSource.fromHover,
                            );
                            widget.reglogNotifier.value = RouteType(
                              path: 'login',
                              source: RouteSource.fromClick,
                            );
                            widget.guestNotifier.value = null;
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
      },
    );
  }
}
