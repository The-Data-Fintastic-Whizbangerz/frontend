import 'package:flutter/material.dart';
import '../../pages/signin/signin_form.dart';

class SignInTablet extends StatelessWidget {
  const SignInTablet({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double ratio = MediaQuery.of(context).size.aspectRatio;

    print(ratio);
    return Container(
      color: Colors.black26,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ratio * 250, vertical: ratio * 100),
        // color: Colors.amber,
        child: SignInForm(),
      ),
    );
  }
}
