import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../app/landing_page.dart';

class TopMenu extends StatelessWidget {
  final String page;
  const TopMenu({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: NavigationBar(
        backgroundColor: Colors.transparent,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        destinations: guestRoutes.map((route) {
          // int index = routes.indexOf(page);
          return ListTile(
            // hoverColor: Colors.red,
            selected: route.path == page,
            title: Text(route.path.toUpperCase(), textAlign: TextAlign.center),
            titleAlignment: ListTileTitleAlignment.center,
            onTap: () {
              if (guestRoutes.indexOf(route) == -1) {
                Navigator.pushNamed(context, '/${route.path}/Tune');
              } else {
                Navigator.pushNamed(context, '/${route.path}');
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
