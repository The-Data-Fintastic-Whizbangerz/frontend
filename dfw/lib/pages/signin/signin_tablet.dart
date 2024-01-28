import 'package:flutter/material.dart';
import '../../pages/signin/signin_form.dart';

class SignInTablet extends StatelessWidget {
  const SignInTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                child: Image.asset('images/cthtc-logo.jpg', scale: 3)),
          ),
          Expanded(
            child: SignInForm(),
          ),
        ],
      ),
    );
  }
}
