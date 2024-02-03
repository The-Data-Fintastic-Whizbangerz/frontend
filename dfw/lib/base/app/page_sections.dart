import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/signin/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import '../routes/constants.dart';
import '../routes/route_type.dart';
import '../utils/authentications/auth_bloc.dart';

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
  final double _minPageHeight = 600;

  PageController _pageController = PageController();

  // Find the index of the user scroll in list
  int get _pageIndex {
    final userScrollIndex = widget.guestNotifier.value?.path;
    int index = widget.guests.indexWhere((element) {
      return element == userScrollIndex;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.guestNotifier.addListener(() {
      final fromScroll =
          widget.guestNotifier.value?.source == RouteSelectionSource.fromScroll;
      if (_pageController.hasClients && !fromScroll) {
        _pageController.animateToPage(
          _pageIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
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
    RouteConst.GUIDES_PAGE,
    RouteConst.ABOUT_PAGE,
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
        itemCount: widget.guests.length,
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
        initialPage: _pageIndex,
      );
    } else {
      _pageController = PageController(
        viewportFraction: 1,
        initialPage: _pageIndex,
      );
    }
  }

  void _onUserScroll() {
    final pageIndex = _pageController.page?.floor() ?? 0;
    final userScrollPath = widget.guests[pageIndex];
    widget.guestNotifier.value = RouteType(
      path: userScrollPath,
      source: RouteSelectionSource.fromScroll,
    );
  }
}
