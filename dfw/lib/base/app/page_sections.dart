import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/signin/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

import '../../pages/signup/signup_page.dart';
import '../routes/constants.dart';
import '../utils/authentications/auth_bloc.dart';
import 'route_code.dart';

class RouteSections extends StatefulWidget {
  final List<String> routes;
  final List<String> reglog;
  final ValueNotifier<RouteCode?> routeNotifier;
  final ValueNotifier<RouteCode?> reglogNotifier;

  const RouteSections({
    Key? key,
    required this.routes,
    required this.reglog,
    required this.routeNotifier,
    required this.reglogNotifier,
  }) : super(key: key);

  @override
  _RouteSectionsState createState() => _RouteSectionsState();
}

class _RouteSectionsState extends State<RouteSections> {
  final double _minPageHeight = 600;

  PageController _pageController = PageController();

  // Find the index of the color code from the colors list
  int get _colorCodeIndex {
    final hexColorCode = widget.routeNotifier.value?.pathCode;
    int index = widget.routes.indexWhere((element) {
      return element == hexColorCode;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.routeNotifier.addListener(() {
      final fromScroll =
          widget.routeNotifier.value?.source == RouteSelectionSource.fromScroll;
      if (_pageController.hasClients && !fromScroll) {
        _pageController.animateToPage(
          _colorCodeIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
      valueListenables: [widget.routeNotifier, widget.reglogNotifier],
      builder: (BuildContext _, List<dynamic> values, Widget? __) {
        List<String?> pairs =
            values.map((element) => (element as RouteCode?)?.pathCode).toList();
        print(pairs);
        if ((values.last as RouteCode?)?.pathCode != null) {
          return BlocProvider(
            create: (context) => AuthBloc(),
            child: SignInPage(),
          );
        } else {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final availableHeight = constraints.maxHeight;
              _updatePageController(availableHeight);
              return _pageView();
            },
          );
        }
      },
    );
  }

  List<RouteConst> guestRoutes = [
    RouteConst.HOME_PAGE,
    RouteConst.CALCULATOR_PAGE,
    RouteConst.CONTACT_PAGE,
  ];

  NotificationListener<Notification> _pageView() {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is UserScrollNotification) {
          _onUserScroll();
        }
        return true;
      },
      child: PageView.builder(
        pageSnapping: false,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: widget.routes.length,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return guestRoutes[index].widget;
        },
      ),
    );
  }

  void _updatePageController(double availableHeight) {
    if (availableHeight < _minPageHeight) {
      _pageController = PageController(
        viewportFraction: _minPageHeight / availableHeight,
        initialPage: _colorCodeIndex,
      );
    } else {
      _pageController = PageController(
        viewportFraction: 1,
        initialPage: _colorCodeIndex,
      );
    }
  }

  void _onUserScroll() {
    final pageIndex = _pageController.page?.floor() ?? 0;
    final hexColorCode = widget.routes[pageIndex];
    widget.routeNotifier.value = RouteCode(
      pathCode: hexColorCode,
      source: RouteSelectionSource.fromScroll,
    );
  }
}
