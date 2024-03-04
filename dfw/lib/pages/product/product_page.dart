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

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final ScrollController _controller = ScrollController();
  late bool isScrollEnd = false;

  @override
  void initState() {
    _controller.addListener(() {
      // _scrollDown();
      setState(() {
        isScrollEnd = _controller.position.atEdge &&
            (_controller.position.userScrollDirection.index == 0 ||
                _controller.position.userScrollDirection.index == 2);
      });

      print(_controller.position.userScrollDirection);
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

// This is what you're looking for!
  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOutCirc,
    );
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Loan eligibility calculator',
                          style: TextStyle(
                              height: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(
                        'Take the guesswork out of borrowing with our loan eligibility calculator and see how much you can borrow!',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.8,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Simply put in your details to discover your acceptance chances. It only takes 2 minutes and will not impact your credit score!',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.8,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  Text(
                    'At LoanWise, safeguarding your data privacy is paramount. We will not save or utilise any personal details provided for any purposes beyond what is intended. We are committed to ensuring your information remains secure and confidential.',
                    style: TextStyle(
                      fontSize: 10,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: _form(context)),
                  ),
                ),
                isScrollEnd
                    ? _submit()
                    : ElevatedButton(
                        onPressed: _scrollDown,
                        child: Text('Load More...'),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget gridTile(BuildContext context, Text text, Widget widget) {
  return StaggeredGrid.count(
      crossAxisCount: context.responsive(sm: 1, md: 2),
      mainAxisSpacing: context.responsive(sm: 1, md: 10),
      children: [type(1, true, text), type(1, false, widget)]);
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
      border: OutlineInputBorder(borderRadius: BorderRadius.zero),
      contentPadding: EdgeInsets.all(25),
    ),
  );
}

Widget dropdownField({required List<DropdownMenuItem<String?>> items}) {
  return DropdownButtonFormField(
    dropdownColor: Colors.purple[100],
    elevation: 1,
    isExpanded: true,
    value: null,
    onChanged: (newValue) {},
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.zero),
      contentPadding: EdgeInsets.zero,
    ),
    items: items,
  );
}

Widget _form(BuildContext context) {
  return StaggeredGrid.count(
    crossAxisCount: 1,
    mainAxisSpacing: context.responsive(sm: 1, md: 10),
    children: [
      type(
          2,
          true,
          const Text('About the loan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      gridTile(
          context, Text('How much would you like to borrow?'), textfield()),
      gridTile(context, Text('What is the purpose of the loan?'), textfield()),
      gridTile(
          context,
          Text('Loan grade'),
          dropdownField(
              items: List.generate(
                  loadGrade.length,
                  (index) => DropdownMenuItem(
                      value: loadGrade[index],
                      alignment: Alignment.center,
                      child: Text(loadGrade[index]))))),
      type(
          2,
          true,
          const Text('About You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      gridTile(
          context,
          Text('Title'),
          dropdownField(
              items: List.generate(
                  title.length,
                  (index) => DropdownMenuItem(
                      value: title[index],
                      alignment: Alignment.center,
                      child: Text(title[index]))))),
      gridTile(context, Text('Full Name'), textfield()),
      gridTile(context, Text('Age'), textfield()),
      gridTile(
          context,
          Text('Marital Status'),
          dropdownField(
              items: List.generate(
                  maritalStatus.length,
                  (index) => DropdownMenuItem(
                      value: maritalStatus[index],
                      alignment: Alignment.center,
                      child: Text(maritalStatus[index]))))),
      gridTile(context, Text('Email Address'), textfield()),
      gridTile(context, Text('Mobile Number'), textfield()),
      gridTile(
          context,
          Text('Residential Status'),
          dropdownField(
              items: List.generate(
                  residentialStatus.length,
                  (index) => DropdownMenuItem(
                      value: residentialStatus[index],
                      alignment: Alignment.center,
                      child: Text(residentialStatus[index]))))),
      type(
          2,
          true,
          const Text('Your Employment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      gridTile(
          context,
          Text('Employment Status'),
          dropdownField(
              items: List.generate(
                  employmentStatus.length,
                  (index) => DropdownMenuItem(
                      value: employmentStatus[index],
                      alignment: Alignment.center,
                      child: Text(employmentStatus[index]))))),
      // Need change Datetime
      gridTile(context, Text('When did you work at current employment?'),
          textfield()),
      //
      gridTile(
          context,
          Text('When do you get paid?'),
          dropdownField(
              items: List.generate(
                  paidPeriod.length,
                  (index) => DropdownMenuItem(
                      value: paidPeriod[index],
                      alignment: Alignment.center,
                      child: Text(paidPeriod[index]))))),
      type(
          2,
          true,
          const Text('Your Finances',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      gridTile(
          context, Text('What is your monthly income after tax?'), textfield()),
      gridTile(
          context, Text('What is your monthly mortgage or rent?'), textfield()),
      gridTile(context, Text('How many children or dependents do you have?'),
          textfield()),
      gridTile(context, Text('Person default'), textfield()),
      gridTile(context, Text('Credit history length'), textfield()),
    ],
  );
}

Widget _submit() {
  return ElevatedButton(
    onPressed: () {},
    child: Text('Check my eligibility'),
    style: TextButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.purple[400]),
  );
}

List<String> loadGrade = [
  'Grade A',
  'Grade B',
  'Grade C',
  'Grade D',
  'Grade E',
  'Grade F',
  'Grade G',
];

List<String> title = [
  'Mr',
  'Mrs',
  'Miss',
  'Ms',
];

List<String> maritalStatus = [
  'Civil Partnership',
  'Divorced',
  'Living with Parents',
  'Married',
  'Separated',
  'Single',
  'Widow / Widower',
  'Other',
];

List<String> residentialStatus = [
  'Homeowner',
  'Council Tenant',
  'Living with Parents',
  'Private Tenant',
  'Shared Ownership Scheme',
  'Other'
];

List<String> employmentStatus = [
  'Employed Full-time',
  'Employed Part-time',
  'Full-time Carer',
  'Self Employed',
  'Retired',
  'Semi Retired',
  'Student',
  'Unemployed'
];

List<String> paidPeriod = [
  'Monthly',
  'Four Weekly',
  'Fortnightly',
  'Weekly',
  'Other'
];
