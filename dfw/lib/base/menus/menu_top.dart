import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import '../extensions/themes.dart';
import '../routes/route_bloc.dart';
import '../routes/route_type.dart';
import 'menu_button.dart';

class TopNavigationMenu extends StatefulWidget {
  // final ValueNotifier<RouteType?> productNotifier;
  const TopNavigationMenu({
    Key? key,
    // required this.productNotifier,
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
    // print(s1);
    // print(s2);
    int index =
        s1.indexWhere((element) => element.path == s2?.path.split('/')[0]);
    return index > -1 ? index : -1;
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
          context
              .read<RouteBloc>()
              .add(Guest_RouteEvent(guests: guests, notifier: guest_notifier));
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
            // widget.productNotifier
          ],
          builder: (context, values, child) {
            return Container(
              width: width,
              decoration:
                  // getCurrent(guests, guest_notifier.value) == 0
                  BoxDecoration(color: Colors.white12),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Image.asset('images/DFW-logo-XS.png')),
                    Expanded(
                      flex: (guests.length * 100) ~/ width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: (guests.length * 100) ~/ width,
                            child: SizedBox(
                              height: 50,
                              child: ListView.builder(
                                shrinkWrap: true,
                                // padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: guests.length,
                                itemBuilder: (context, index) {
                                  return NavigationMenuButton(
                                    path: guests[index].path,
                                    selected: getCurrent(
                                                guests, guest_notifier.value) ==
                                            index &&
                                        reglog_notifier.value == null,
                                    hasSubMenu:
                                        hoverNotifier.value?.path == 'products',
                                    onPressed: () {
                                      guest_notifier.value = RouteType(
                                        path: guests[index].path,
                                        source: RouteSource.fromClick,
                                      );
                                      hoverNotifier.value = null;
                                      reglog_notifier.value = null;
                                      print('MENUTOP CLICK: ${guest_notifier}');
                                    },
                                    onHover: (value) {
                                      hoverNotifier.value = RouteType(
                                        path: guests[index].path,
                                        source: RouteSource.fromHover,
                                      );
                                    },
                                    itemBuilder: (context) {
                                      if (hoverNotifier.value?.path ==
                                          'products') {
                                        return [
                                          PopupMenuItem(
                                            child: Text(
                                                'Loan Eligibility Calculator'),
                                            onTap: () {
                                              hoverNotifier.value = null;
                                              guest_notifier.value = RouteType(
                                                path:
                                                    'products/loan-eligibility-calculator',
                                                source: RouteSource.fromClick,
                                              );
                                              reglog_notifier.value = null;
                                              print(
                                                  'MENUTOP CLICK: ${guest_notifier}');
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
                              height: 50,
                              child: NavigationMenuButton(
                                // init with guest route only
                                path: 'login',
                                selected:
                                    reglog_notifier.value?.path == 'login',
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
                    Container(),
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
