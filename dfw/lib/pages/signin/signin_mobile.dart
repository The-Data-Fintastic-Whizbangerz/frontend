import 'package:flutter/material.dart';
import '../../pages/signin/signin_form.dart';

class SignInMobile extends StatelessWidget {
  const SignInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Image.asset('images/cthtc-logo.jpg', scale: 5),
          ),
          Container(margin: EdgeInsets.only(bottom: 50), child: SignInForm()),
        ]),
      ),
    );
  }
}
