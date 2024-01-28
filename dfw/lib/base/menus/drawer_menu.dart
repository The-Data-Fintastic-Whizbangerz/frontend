import 'package:The_Data_Fintastic_Whizbangerz_Group/base/utils/states/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../menus/signin_menu.dart';

import '../app/landing_page.dart';
import '../utils/authentications/auth_bloc.dart';
import 'signout_menu.dart';

class DrawerMenu extends StatelessWidget {
  final String page;
  const DrawerMenu({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // guestRoutes.removeWhere((element) => element.level == 3);
    // print(guestRoutes);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Drawer(
            child: ListView(
              children: [
                Column(
                  children: guestRoutes.map((route) {
                    // int index = pages.indexOf(item);
                    return ListTile(
                      selected: route.path == page,
                      onTap: () {
                        Navigator.pushNamed(context, '/${route.path}');
                      },
                      leading: Icon(route.icon),
                      title: Text(route.path.toUpperCase()),
                    );
                  }).toList(),
                ),
                Divider(),
                isAuth
                    ? SignOutMenu(isExpanded: true)
                    : SignInMenu(isExpanded: true),
              ],
            ),
          ),
        );
      },
    );
  }
}
