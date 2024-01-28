import 'package:flutter/material.dart';

import '../app/landing_page.dart';
import '../routes/constants.dart';

class RailMenu extends StatefulWidget {
  final String page;
  bool isExpanded;
  RailMenu({
    Key? key,
    required this.page,
    required this.isExpanded,
  }) : super(key: key);

  @override
  State<RailMenu> createState() => _RailMenuState();
}

class _RailMenuState extends State<RailMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: widget.isExpanded ? 150 : 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: verifiedRoutes.map((route) {
              // int index = pages.indexOf(item);
              return ListTile(
                selected: route.path == widget.page,
                onTap: () {
                  if (route == RouteConst.PROFILE_PAGE) {
                    Navigator.pushNamed(context, '/${route.path}/Tune');
                  } else {
                    Navigator.pushNamed(context, '/${route.path}');
                  }
                },
                leading: Icon(route.icon),
                title:
                    widget.isExpanded ? Text(route.path.toUpperCase()) : null,
              );
            }).toList(),
          ),
          ListTile(
            trailing: widget.isExpanded
                ? Icon(Icons.menu_open_outlined)
                : Icon(Icons.double_arrow),
            onTap: () {
              setState(() {
                widget.isExpanded = !widget.isExpanded;
              });
            },
          )
        ],
      ),
    );
  }
}
