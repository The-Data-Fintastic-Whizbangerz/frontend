import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../base/utils/authentications/auth_bloc.dart';
import 'signin_form.dart';

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
    double ratio = MediaQuery.of(context).size.aspectRatio;
    return Container(
      color: Colors.black26,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: ratio * 200, vertical: ratio * 80),
        // color: Colors.amber,
        child: SignInForm(),
      ),
    );
  }
}
