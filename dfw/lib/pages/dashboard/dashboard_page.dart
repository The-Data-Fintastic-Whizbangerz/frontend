import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/extensions/responsiveWidget.dart';
import '/base/utils/authentications/auth_bloc.dart';
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
        return ResponsiveWidget(
          mobile: DashboardMobile(),
          tablet: DashboardTablet(),
          desktop: DashboardDesktop(),
        );
      },
    );
  }
}
