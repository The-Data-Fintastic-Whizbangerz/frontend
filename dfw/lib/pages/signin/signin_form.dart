import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.aspectRatio;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Credit Wise',
            style: TextStyle(
                color: Colors.white,
                fontSize: 60 * ratio,
                fontWeight: FontWeight.bold),
          ),
          _usernameField(),
          _passwordField(),
          _loginButton(),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.email),
          hintText: 'Enter Email',
          contentPadding: EdgeInsets.only(top: 15),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if ((value == null || value.isEmpty)) {
            // if ((value == null || value.isEmpty) || !state.isValidUsername) {
            return 'Username required \"@\" domain';
          }
          return null;
        },
        onChanged: (value) {},
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye),
            ),
            prefixIcon: Icon(Icons.remove_red_eye),
            contentPadding: const EdgeInsets.only(top: 18.0),
            hintText: 'Enter Password',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              // if (value == null || value.isEmpty || !state.isValidPassword) {
              return 'Password required uppercase, lowercase, digit, special';
            }
            return null;
          },
          onChanged: (value) {}),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        child: Center(heightFactor: 3, child: Text('Log In')),
        onPressed: () {},
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        child: Center(heightFactor: 3, child: Text('Register')),
        onPressed: () {
          // guestNotifier.value = null;
          // reglogNotifier.value = RouteType(
          //   path: 'register',
          //   source: RouteSelectionSource.fromButtonClick,
          // );
        },
      ),
    );
  }
}
