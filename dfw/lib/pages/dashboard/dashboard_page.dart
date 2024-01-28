import 'package:The_Data_Fintastic_Whizbangerz_Group/base/utils/states/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/extensions/responsiveWidget.dart';
import '/base/app/landing_page.dart';
import '/base/utils/authentications/auth_bloc.dart';
import '/pages/error/error_page.dart';
import 'dashboard_desktop.dart';
import 'dashboard_mobile.dart';
import 'dashboard_tablet.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is Load_AuthState)
          return ResponsiveWidget(
            mobile: DashboardMobile(),
            tablet: DashboardTablet(),
            desktop: DashboardDesktop(),
          );
        else
          return ErrorPage();
        ;
      },
    );
  }
}
