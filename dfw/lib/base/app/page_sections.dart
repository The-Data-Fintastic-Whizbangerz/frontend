import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import '../routes/constants.dart';
import '../routes/route_type.dart';

class PageSection extends StatefulWidget {
  final List<String> guests;
  final List<String> reglog;
  final ValueNotifier<RouteType?> guestNotifier;
  final ValueNotifier<RouteType?> reglogNotifier;

  const PageSection({
    Key? key,
    required this.guests,
    required this.reglog,
    required this.guestNotifier,
    required this.reglogNotifier,
  }) : super(key: key);

  @override
  _PageSectionState createState() => _PageSectionState();
}

class _PageSectionState extends State<PageSection> {
  // final double _minPageHeight = 600;

  PageController _guestController = PageController();
  PageController _reglogController = PageController();

  // Find the index of the user scroll in list
  int get _guestIndex {
    final userScrollIndex = widget.guestNotifier.value?.path;
    int index = widget.guests.indexWhere((element) {
      return element == userScrollIndex;
    });
    return index > -1 ? index : 0;
  }

  int get _reglogIndex {
    final userTypeUrl = widget.reglogNotifier.value?.path;
    int index = widget.reglog.indexWhere((element) {
      return element == userTypeUrl;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.guestNotifier.addListener(() {
      final fromScroll =
          widget.guestNotifier.value?.source == RouteSelectionSource.fromScroll;
      if (_guestController.hasClients && !fromScroll) {
        _guestController.animateToPage(
          _guestIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
    widget.reglogNotifier.addListener(() {
      final fromAddress = widget.reglogNotifier.value?.source ==
          RouteSelectionSource.fromBrowserAddressBar;
      if (_reglogController.hasClients && !fromAddress) {
        _reglogController.jumpToPage(
          _reglogIndex,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
      valueListenables: [widget.guestNotifier, widget.reglogNotifier],
      builder: (BuildContext _, List<dynamic> values, Widget? __) {
        List<String?> pairs =
            values.map((element) => (element as RouteType?)?.path).toList();
        print(pairs);

        // temporary
        if ((values.last as RouteType?)?.path != null) {
          _reglogController = PageController(
            viewportFraction: 1,
            initialPage: _reglogIndex,
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
        } else {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // final availableHeight = constraints.maxHeight;
              _guestController = PageController(
                viewportFraction: 1,
                initialPage: _guestIndex,
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
  }

  List<RouteConst> guestRoutes = [
    RouteConst.HOME_PAGE,
    RouteConst.PRODUCT_PAGE,
    RouteConst.GUIDES_PAGE,
    RouteConst.NEWS_PAGE,
    RouteConst.ABOUT_PAGE,
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
    final userScrollPath = widget.guests[pageIndex];
    widget.guestNotifier.value = RouteType(
      path: userScrollPath,
      source: RouteSelectionSource.fromScroll,
    );
  }

  void _onReglogEnter() {
    final pageIndex = _reglogController.page?.floor() ?? 0;
    final reglogPath = widget.reglog[pageIndex];
    widget.reglogNotifier.value = RouteType(
      path: reglogPath,
      source: RouteSelectionSource.fromBrowserAddressBar,
    );
  }
}
