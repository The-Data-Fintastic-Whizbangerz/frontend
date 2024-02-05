import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../base/extensions/neumorphism.dart';
import '../../base/utils/authentications/auth_bloc.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // if (state.status is StatusAuthenticated) {
        //   print('Status -> Signin: ' + state.status.toString());
        //   Navigator.popAndPushNamed(context, '/home');
        // }
        // if (state.status is StatusUnauthenticated) {
        //   print('Status -> Signin: ' + state.status.toString());
        // }
      },
      builder: (context, state) {
        double ratio = MediaQuery.of(context).size.aspectRatio;
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login Loan Wise',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50 * ratio,
                    fontWeight: FontWeight.bold),
              ),
              _usernameField(),
              _passwordField(),
              _loginButton(),
              _registerButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
            onChanged: (value) {
              context.read<AuthBloc>().add(Username_AuthEvent(username: value));
            },
          ),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
              onChanged: (value) => context.read<AuthBloc>().add(
                    Password_AuthEvent(password: value),
                  )),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          child: Center(heightFactor: 3, child: Text('Log In')),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              (context).read<AuthBloc>().add(Submit_AuthEvent(
                  username: state.username, password: state.password));

              // (context).read<AuthBloc>().add(Verify_AuthEvent());
              Navigator.popAndPushNamed(context, '/home');
            }
          },
        );
      },
    );
  }

  Widget _registerButton() {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
          padding: EdgeInsets.all(15), child: Text('Register Account')),
      onTap: () {
        // Navigator.pushNamed(context, '/signup');
      },
    );
  }
}
