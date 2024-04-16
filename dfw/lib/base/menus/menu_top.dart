import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import '../extensions/themes.dart';
import '../routes/route_bloc.dart';
import '../routes/route_type.dart';
import 'menu_button.dart';

class TopNavigationMenu extends StatefulWidget {
  final ValueNotifier<RouteType?> productNotifier;
  const TopNavigationMenu({
    Key? key,
    required this.productNotifier,
  }) : super(key: key);

  @override
  State<TopNavigationMenu> createState() => _TopNavigationMenuState();
}

class _TopNavigationMenuState extends State<TopNavigationMenu> {
  @override
  void initState() {
    super.initState();
  }

  ValueNotifier<RouteType?> guest_notifier = ValueNotifier(null);
  ValueNotifier<RouteType?> reglog_notifier = ValueNotifier(null);
  List<RouteType> guests = [];
  List<RouteType> reglog = [];
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
          guests = state.routes;
          guest_notifier = state.notifier;
        }
        if (state is Reglog_RouteState) {
          reglog = state.routes;
          reglog_notifier = state.notifier;
        }
      },
      builder: (context, state) {
        return MultiValueListenableBuilder(
          valueListenables: [
            guest_notifier,
            reglog_notifier,
            hoverNotifier,
            widget.productNotifier
          ],
          builder: (context, values, child) {
            return Container(
              width: width,
              decoration:
                  // getCurrent(guests, guest_notifier.value) == 0
                  BoxDecoration(color: Colors.white10),
              // : BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [
              //         BasicTheme.leftBackground,
              //         BasicTheme.rightBackground,
              //         BasicTheme.leftBackground,
              //         BasicTheme.rightBackground,
              //       ],
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomLeft,
              //       stops: [0.1, 0.4, 0.7, 1],
              //     ),
              //   ),
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
                              path: guests[index].path,
                              selected:
                                  getCurrent(guests, guest_notifier.value) ==
                                          index &&
                                      reglog_notifier.value == null &&
                                      widget.productNotifier.value == null,
                              hasSubMenu:
                                  hoverNotifier.value?.path == 'products',
                              onPressed: () {
                                guest_notifier.value = RouteType(
                                  path: guests[index].path,
                                  source: RouteSource.fromClick,
                                );
                                hoverNotifier.value = null;
                                reglog_notifier.value = null;
                                widget.productNotifier.value = null;

                                // context.read<RouteBloc>().add(Guest_RouteEvent(
                                //     guests: test_guests,
                                //     notifier: test_notifier));
                                print('MENUTOP CLICK: ${guest_notifier}');
                              },
                              onHover: (value) {
                                // test_notifier.value = RouteType(
                                //   path: test_guests[index].path,
                                //   source: RouteSource.fromHover,
                                // );

                                hoverNotifier.value = RouteType(
                                  path: guests[index].path,
                                  source: RouteSource.fromHover,
                                );
                                // widget.reglogNotifier.value = null;

                                // print('MENUTOP HOVER: ${test_notifier}');
                              },
                              itemBuilder: (context) {
                                if (hoverNotifier.value?.path == 'products') {
                                  return [
                                    PopupMenuItem(
                                      child:
                                          Text('Loan Eligibility Calculator'),
                                      onTap: () {
                                        widget.productNotifier.value =
                                            RouteType(
                                          path: 'loan-eligibility-calculator',
                                          source: RouteSource.fromClick,
                                        );
                                        hoverNotifier.value = null;
                                        guest_notifier.value = null;
                                        reglog_notifier.value = null;
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: Text('Repayment calculator'),
                                    ),
                                    PopupMenuItem(
                                      child: Text('Loan recommender'),
                                    ),
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
                          // init with guest route only
                          path: 'login',
                          selected: reglog_notifier.value?.path == 'login',
                          hasSubMenu: false,
                          onPressed: () {
                            guest_notifier.value = null;
                            reglog_notifier.value = RouteType(
                              path: 'login',
                              source: RouteSource.fromClick,
                            );
                          },
                          // onHover: (value) {
                          //   hoverNotifier.value = RouteType(
                          //     path: 'login',
                          //     source: RouteSource.fromHover,
                          //   );
                          //   widget.reglogNotifier.value = RouteType(
                          //     path: 'login',
                          //     source: RouteSource.fromClick,
                          //   );
                          //   test_notifier.value = null;
                          // },
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
