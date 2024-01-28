import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/authentications/auth_bloc.dart';

class SignOutMenu extends StatelessWidget {
  final bool isExpanded;
  const SignOutMenu({
    Key? key,
    required this.isExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? null : 80,
      child: ListTile(
        leading: isExpanded ? Icon(Icons.logout) : null,
        title: Text('Logout'),
        onTap: () {
          context.read<AuthBloc>()..add(Unknown_AuthEvent());
          Navigator.pushNamed(context, '/signout');
        },
      ),
    );
  }
}
