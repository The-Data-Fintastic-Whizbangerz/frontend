import 'package:flutter/material.dart';
import '../../pages/signin/signin_form.dart';

class SignInDesktop extends StatelessWidget {
  const SignInDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'images/cthtc-logo.jpg',
                scale: 2,
              ),
            ),
          ),
          Expanded(
            child: SignInForm(),
          ),
        ],
      ),
    );
  }
}
