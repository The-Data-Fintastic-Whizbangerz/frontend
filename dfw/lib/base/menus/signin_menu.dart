import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/authentications/auth_bloc.dart';
import 'package:flutter/material.dart';

class SignInMenu extends StatefulWidget {
  final bool isExpanded;
  const SignInMenu({
    Key? key,
    required this.isExpanded,
  }) : super(key: key);

  @override
  State<SignInMenu> createState() => _SignInMenuState();
}

class _SignInMenuState extends State<SignInMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          width: widget.isExpanded ? null : 80,
          child: ListTile(
            leading: widget.isExpanded ? Icon(Icons.login) : null,
            title: Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, '/signin');
            },
          ),
        );
      },
    );
  }
}
