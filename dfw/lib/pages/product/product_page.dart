import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/loan_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends Page {
  final String? path;
  final String? extra;
  ProductPage({
    required this.path,
    required this.extra,
  }) : super(key: ValueKey("$path$extra"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return LoanPage();
      },
    );
  }
  // final VoidCallback
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('ProductWidget'),
        ),
      ),
    );
  }
}
