import 'package:flutter/material.dart';

import 'route_code.dart';

class RouteSections extends StatefulWidget {
  final List<String> routes;
  final ValueNotifier<RouteCode?> routeNotifier;

  const RouteSections({
    Key? key,
    required this.routes,
    required this.routeNotifier,
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final availableHeight = constraints.maxHeight;
        _updatePageController(availableHeight);
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              _onUserScroll();
            }
            return true;
          },
          child: _pageView(),
        );
      },
    );
  }

  PageView _pageView() {
    return PageView.builder(
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: widget.routes.length,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final color = widget.routes[index];
        return Container(
          child: Text(widget.routes[index]),
        );
      },
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
