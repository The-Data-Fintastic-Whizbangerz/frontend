import 'package:flutter_bloc/flutter_bloc.dart';

import '/base/extensions/responsiveContext.dart';
import '/base/extensions/themes.dart';
import '/pages/product/loan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      body: Flex(
        direction: context.responsive(sm: Axis.vertical, md: Axis.horizontal),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Borrowing calculator',
                      style: TextStyle(
                          height: 2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'Use our borrowing calculator to see how much you could borrow (subject to status).',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    'Our quick 2 minutes eligibility calculator uses a ‘soft search’ to find your acceptance chances, so - unlike applying - it doesn’t impact your credit score. ',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: _form(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget type(int cross, bool isText, Widget widget) {
  return StaggeredGridTile.fit(
    crossAxisCellCount: cross,
    child: Container(
      height: 30,
      decoration: isText
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.purple[50],
            ),
      child: Align(alignment: Alignment.centerLeft, child: widget),
    ),
  );
}

Widget textfield() {
  return TextField(
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(25),
    ),
  );
}

Widget _form(BuildContext context) {
  return StaggeredGrid.count(
    crossAxisCount: context.responsive(sm: 1, md: 2),
    mainAxisSpacing: context.responsive(sm: 1, md: 10),
    // crossAxisSpacing: 1,
    children: [
      type(
          2,
          true,
          const Text(
            'About the loan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      type(1, true, Text('How much would you like to borrow?')),
      type(1, false, textfield()),
      type(1, true, Text('What is the purpose of the loan?')),
      type(1, false, textfield()),
      type(1, true, Text('Loan grade')),
      type(
          1,
          false,
          DropdownButtonFormField(
              dropdownColor: Colors.purple[100],
              isExpanded: true,
              value: null,
              onChanged: (newValue) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.zero,
              ),
              items: const [
                DropdownMenuItem(
                    child: Text('AAA'),
                    value: 'AAA',
                    alignment: Alignment.center),
                DropdownMenuItem(
                    child: Text('BBB'),
                    value: 'BBB',
                    alignment: Alignment.center),
                DropdownMenuItem(
                    child: Text('CCC'),
                    value: 'CCC',
                    alignment: Alignment.center),
                DropdownMenuItem(
                    child: Text('DDD'),
                    value: 'DDD',
                    alignment: Alignment.center),
              ])),
      type(
          2,
          true,
          const Text(
            'About You',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      type(1, true, Text('Title')),
      type(1, false, textfield()),
      type(1, true, Text('Full Name')),
      type(1, false, textfield()),
      type(1, true, Text('Age')),
      type(1, false, textfield()),
      type(1, true, Text('Marital Status')),
      type(1, false, textfield()),
      type(1, true, Text('Email Address')),
      type(1, false, textfield()),
      type(1, true, Text('Mobile Number')),
      type(1, false, textfield()),
      type(1, true, Text('Residential Status')),
      type(1, false, textfield()),
      type(
          2,
          true,
          const Text(
            'Your Employment',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      type(1, true, Text('Employment status')),
      type(1, false, textfield()),
      type(1, true, Text('When did you work at current employment?')),
      type(1, false, textfield()),
      type(1, true, Text('Employment length')),
      type(1, false, textfield()),
      type(1, true, Text('When do you get paid?')),
      type(1, false, textfield()),
      type(
          2,
          true,
          const Text(
            'Your Finances',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      type(1, true, Text('What is your monthly income after tax?')),
      type(1, false, textfield()),
      type(1, true, Text('What is your monthly mortgage or rent?')),
      type(1, false, textfield()),
      type(1, true, Text('How many children or dependents do you have?')),
      type(1, false, textfield()),
      type(1, true, Text('Person default')),
      type(1, false, textfield()),
      type(1, true, Text('Credit history length')),
      type(1, false, textfield()),
      StaggeredGridTile.fit(
        crossAxisCellCount: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: TextButton(
            onPressed: () {},
            child: Center(child: Text('Check my eligibility')),
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple[400]),
          ),
        ),
      ),
    ],
  );
}
