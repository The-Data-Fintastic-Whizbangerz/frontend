import 'package:flutter/material.dart';
import '../app/landing_page.dart';
import '../routes/constants.dart';

class BottomMenu extends StatelessWidget {
  final String page;
  const BottomMenu({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: verifiedRoutes.map((route) {
        return ListTile(
          selected: route.path == page,
          title: Icon(route.icon),
          titleAlignment: ListTileTitleAlignment.center,
          onTap: () {
            if (route == RouteConst.PROFILE_PAGE) {
              Navigator.pushNamed(context, '/${route.path}/Tune');
            } else {
              Navigator.pushNamed(context, '/${route.path}');
            }
          },
        );
      }).toList(),
    );
  }
}