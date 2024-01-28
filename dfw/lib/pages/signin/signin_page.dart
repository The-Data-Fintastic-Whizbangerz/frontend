import 'package:flutter/material.dart';
import '../../base/extensions/responsiveWidget.dart';
import 'signin_desktop.dart';
import 'signin_mobile.dart';
import 'signin_tablet.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: SignInMobile(),
      tablet: SignInTablet(),
      desktop: SignInDesktop(),
    );
  }
}
