import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/extensions/responsiveWidget.dart';
import '../../base/utils/authentications/auth_bloc.dart';
import 'signin_desktop.dart';
import 'signin_mobile.dart';
import 'signin_tablet.dart';

class SignInPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return SignInWidget();
        });
  }
}

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: SignInTablet(),
      // child: ResponsiveWidget(
      //   mobile: SignInMobile(),
      //   tablet: SignInTablet(),
      //   desktop: SignInDesktop(),
      // ),
    );
  }
}
