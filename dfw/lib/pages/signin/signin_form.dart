import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
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
    return Form(
      key: _formKey,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Credit Wise',
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        context.responsive(xs: 30, sm: 40, md: 50, lg: 60),
                    fontWeight: FontWeight.bold),
              ),
              _usernameField(),
              _passwordField(),
              _loginButton(),
              _registerButton(),
            ],
          ),
          _forgotPasswordButton(),
        ],
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width /
          context.responsive(xs: 1.5, sm: 2, md: 3, lg: 4, xl: 6),
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
          contentPadding: EdgeInsets.only(top: 12),
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
      width: MediaQuery.of(context).size.width /
          context.responsive(xs: 1.5, sm: 2, md: 3, lg: 4, xl: 6),
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
            contentPadding: const EdgeInsets.only(top: 12.0),
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
      height: 40.0,
      width: MediaQuery.of(context).size.width /
          context.responsive(xs: 1.5, sm: 2, md: 3, lg: 4, xl: 6),
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
      height: 40.0,
      width: MediaQuery.of(context).size.width /
          context.responsive(xs: 1.5, sm: 2, md: 3, lg: 4, xl: 6),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
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

  Widget _forgotPasswordButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 40.0,
      width: MediaQuery.of(context).size.width /
          context.responsive(xs: 1.5, sm: 2, md: 3, lg: 4, xl: 6),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
        ),
        child: Center(heightFactor: 3, child: Text('Forgot Password')),
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
