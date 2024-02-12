import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/loan_page.dart';

import '../../pages/product/product_page.dart';
import '../routes/constants.dart';
import '../routes/route_bloc.dart';
import '../routes/route_type.dart';

class PageSection extends StatefulWidget {
  final ValueNotifier<RouteType?> productNotifier;

  const PageSection({
    Key? key,
    required this.productNotifier,
  }) : super(key: key);

  @override
  _PageSectionState createState() => _PageSectionState();
}

class _PageSectionState extends State<PageSection> {
  // final double _minPageHeight = 600;

  PageController _guestController = PageController();
  PageController _productController = PageController();
  PageController _reglogController = PageController();

  ValueNotifier<RouteType?> guest_notifier = ValueNotifier(null);
  ValueNotifier<RouteType?> reglog_notifier = ValueNotifier(null);
  List<RouteType> guests = [];
  List<RouteType> reglog = [];
  int getCurrent(List<RouteType> s1, RouteType? s2) {
    int index = s1.indexWhere((element) => element.path == s2?.path);
    return index > -1 ? index : 0;
  }

  void test() {
    guest_notifier.addListener(() {
      final fromScroll = guest_notifier.value?.source == RouteSource.fromScroll;
      if (_guestController.hasClients && !fromScroll) {
        _guestController.jumpToPage(
          getCurrent(guests, guest_notifier.value),
        );
      }
    });
  }

  @override
  initState() {
    super.initState();

    widget.productNotifier.addListener(() {
      final fromClick =
          widget.productNotifier.value?.source == RouteSource.fromClick;
      if (_productController.hasClients && !fromClick) {
        _productController.jumpToPage(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouteBloc, RouteState>(
      listener: (context, state) {
        if (state is Guest_RouteState) {
          guests = state.routes;
          guest_notifier = state.notifier;
          guest_notifier.addListener(() {
            final fromScroll =
                guest_notifier.value?.source == RouteSource.fromScroll;
            if (_guestController.hasClients && !fromScroll) {
              _guestController.jumpToPage(
                getCurrent(guests, guest_notifier.value),
              );
            }
          });
        }
        if (state is Reglog_RouteState) {
          reglog = state.routes;
          reglog_notifier = state.notifier;
          reglog_notifier.addListener(() {
            final fromAddress =
                reglog_notifier.value?.source == RouteSource.fromAddress;
            if (_reglogController.hasClients && !fromAddress) {
              _reglogController.jumpToPage(
                getCurrent(reglog, reglog_notifier.value),
              );
            }
          });
        }
      },
      builder: (context, state) {
        return MultiValueListenableBuilder(
          valueListenables: [
            guest_notifier,
            widget.productNotifier,
            reglog_notifier,
          ],
          builder: (context, values, child) {
            List<String?> pairs =
                values.map((element) => (element as RouteType?)?.path).toList();
            print(pairs);
            if ((values.last as RouteType?)?.path != null) {
              _reglogController = PageController(
                viewportFraction: 1,
                initialPage: getCurrent(reglog, reglog_notifier.value),
              );
              return NotificationListener<Notification>(
                onNotification: (notification) {
                  if (notification is UserScrollNotification) {
                    _onReglogEnter();
                  }
                  return true;
                },
                child: _pageView(
                    routes: reglogRoutes,
                    controller: _reglogController,
                    physics: NeverScrollableScrollPhysics()),
              );
            } else if ((values[1] as RouteType?)?.path != null) {
              return LoanPage();
            } else {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // final availableHeight = constraints.maxHeight;
                  _guestController = PageController(
                    viewportFraction: 1,
                    initialPage: getCurrent(guests, guest_notifier.value),
                  );
                  return NotificationListener<Notification>(
                    onNotification: (notification) {
                      if (notification is UserScrollNotification) {
                        _onGuestScroll();
                      }
                      return true;
                    },
                    child: _pageView(
                        routes: guestRoutes,
                        controller: _guestController,
                        physics: AlwaysScrollableScrollPhysics()),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  List<RouteConst> guestRoutes = [
    RouteConst.HOME_PAGE,
    RouteConst.PRODUCT_PAGE,
    RouteConst.GUIDES_PAGE,
    RouteConst.NEWS_PAGE,
    RouteConst.ABOUT_PAGE,
    RouteConst.CONTACT_PAGE,
  ];

  List<RouteConst> reglogRoutes = [
    RouteConst.SIGNIN_PAGE,
    RouteConst.SIGNUP_PAGE,
    RouteConst.SIGNOUT_PAGE,
  ];

  PageView _pageView(
      {required List<RouteConst> routes,
      required PageController? controller,
      required ScrollPhysics? physics}) {
    return PageView.builder(
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      controller: controller,
      itemCount: routes.length,
      physics: physics,
      itemBuilder: (BuildContext context, int index) {
        return routes[index].widget;
      },
    );
  }

  void _onGuestScroll() {
    final pageIndex = _guestController.page?.floor() ?? 0;
    final userScrollPath = guests[pageIndex].path;
    guest_notifier.value = RouteType(
      path: userScrollPath,
      source: RouteSource.fromScroll,
    );
    print('PAGE SCROLL: ${guest_notifier}');
  }

  void _onReglogEnter() {
    final pageIndex = _reglogController.page?.floor() ?? 0;
    final reglogPath = reglog[pageIndex].path;
    reglog_notifier.value = RouteType(
      path: reglogPath,
      source: RouteSource.fromAddress,
    );
  }
}
