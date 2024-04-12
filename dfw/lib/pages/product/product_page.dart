import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/string.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/service/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/models/creditForm.dart';
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

CreditForm creditForm = CreditForm(
    creditamount: 0,
    duration: 0,
    purpose: 'purpose',
    disposible: 0,
    occupation: 0,
    employLength: 0,
    guarantor: 'guarantor',
    house: 'house',
    residentLength: 'residentLength',
    ageGroup: 0,
    numChild: 0);

class _ProductWidgetState extends State<ProductWidget> {
  final ScrollController _controller = ScrollController();
  late bool isScrollEnd = false;

  String? result;

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
            child: Column(
              // alignment: Alignment.bottomCenter,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: SingleChildScrollView(
                      controller: _controller,
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: _form(context)),
                    ),
                  ),
                ),
                _submit(),
                if (result != null)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(result!),
                  )

                // isScrollEnd  // For longer form
                //     ? _submit(context)
                //     : ElevatedButton(
                //         onPressed: _scrollDown,
                //         child: Text('Load More...'),
                //       )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _submit() {
    return ElevatedButton(
      onPressed: () async {
        print(creditForm.toJson());
        // ProductRepository.instance.testAPI();
        String submit = await ProductRepository.instance.submitData(
          creditamount: creditForm.creditamount,
          duration: creditForm.duration,
          purpose: creditForm.purpose,
          disposible: creditForm.disposible,
          occupation: (creditForm.occupation),
          employLength: creditForm.employLength,
          guarantor: creditForm.guarantor,
          house: creditForm.house,
          residentLength: creditForm.residentLength,
          ageGroup: creditForm.ageGroup,
          numChild: creditForm.numChild,
        );

        setState(() {
          result = submit;
        });
      },
      child: Text('Check my eligibility'),
      style: TextButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.purple[400]),
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
      gridTile(
          context,
          Text('Credit Amount'),
          dropdownField(
              items: List.generate(
                  creditamount.length,
                  (index) => DropdownMenuItem(
                      value: creditamount[index],
                      alignment: Alignment.center,
                      child: Text(creditamount[index]),
                      onTap: () => creditForm.setCreditamount =
                          creditamount.length - index)))),
      gridTile(
          context,
          Text('Duration (month)'),
          dropdownField(
              items: List.generate(
                  duration.length,
                  (index) => DropdownMenuItem(
                      value: duration[index],
                      alignment: Alignment.center,
                      child: Text(duration[index]),
                      onTap: () => creditForm.setDuration =
                          duration.length - index - 1)))),
      gridTile(
          context,
          Text('Purpose'),
          dropdownField(
              items: List.generate(
                  purpose.length,
                  (index) => DropdownMenuItem(
                      value: purpose[index],
                      alignment: Alignment.center,
                      child: Text(purpose[index]
                          .replaceAll(RegExp('_'), ' ')
                          .toCapitalise()),
                      onTap: () => creditForm.setPurpose = purpose[index])))),
      gridTile(
          context,
          Text('Disposible'),
          dropdownField(
              items: List.generate(
                  disposible.length,
                  (index) => DropdownMenuItem(
                      value: disposible[index],
                      alignment: Alignment.center,
                      child: Text(disposible[index]),
                      onTap: () => creditForm.setDisposible = index + 1)))),
      gridTile(
          context,
          Text('Occupation'),
          dropdownField(
              items: List.generate(
                  occupation.length,
                  (index) => DropdownMenuItem(
                      value: occupation[index],
                      alignment: Alignment.center,
                      child: Text(occupation[index]),
                      onTap: () => creditForm.setOccupation =
                          occupation.length - index)))),
      gridTile(
          context,
          Text('Employment Length'),
          dropdownField(
              items: List.generate(
                  employmentLength.length,
                  (index) => DropdownMenuItem(
                      value: employmentLength[index],
                      alignment: Alignment.center,
                      child: Text(employmentLength[index]),
                      onTap: () => creditForm.setEmployLength = index + 1)))),
      gridTile(
          context,
          Text('Who are the other applicant?'),
          dropdownField(
              items: List.generate(
                  otherDebtorsGuarantors.length,
                  (index) => DropdownMenuItem(
                      value: otherDebtorsGuarantors[index],
                      alignment: Alignment.center,
                      child: Text(otherDebtorsGuarantors[index]
                          .replaceAll(RegExp('_'), ' ')
                          .toCapitalise()),
                      onTap: () => creditForm.setGuarantor =
                          otherDebtorsGuarantors[index])))),
      gridTile(
          context,
          Text('What type resident is yours?'),
          dropdownField(
              items: List.generate(
                  housing.length,
                  (index) => DropdownMenuItem(
                      value: housing[index],
                      alignment: Alignment.center,
                      child: Text(housing[index]
                          .replaceAll(RegExp('_'), ' ')
                          .toCapitalise()),
                      onTap: () => creditForm.setHouse = housing[index])))),
      gridTile(
          context,
          Text('How long have you been living in this house?'),
          dropdownField(
              items: List.generate(
                  residenceLength.length,
                  (index) => DropdownMenuItem(
                      value: residenceLength[index],
                      alignment: Alignment.center,
                      child: Text(residenceLength[index]
                          .replaceAll(RegExp('_'), ' ')
                          .toCapitalise()),
                      onTap: () => creditForm.setResidentLength =
                          residenceLength[index])))),
      gridTile(
          context,
          Text('What is you age group?'),
          dropdownField(
              items: List.generate(
                  ageGroup.length,
                  (index) => DropdownMenuItem(
                      value: ageGroup[index],
                      alignment: Alignment.center,
                      child: Text(ageGroup[index]),
                      onTap: () => creditForm.setAgeGroup = index + 1)))),
      gridTile(
          context,
          Text('Number of children'),
          dropdownField(
              items: List.generate(
                  numberOfDependents.length,
                  (index) => DropdownMenuItem(
                      value: numberOfDependents[index],
                      alignment: Alignment.center,
                      child: Text(numberOfDependents[index]),
                      onTap: () => creditForm.setNumChild =
                          numberOfDependents.length - index)))),
    ],
    // children: [
    //   type(
    //       2,
    //       true,
    //       const Text('About the loan',
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    //   gridTile(
    //       context, Text('How much would you like to borrow?'), textfield()),
    //   gridTile(context, Text('What is the purpose of the loan?'), textfield()),
    //   gridTile(
    //       context,
    //       Text('Loan grade'),
    //       dropdownField(
    //           items: List.generate(
    //               loadGrade.length,
    //               (index) => DropdownMenuItem(
    //                   value: loadGrade[index],
    //                   alignment: Alignment.center,
    //                   child: Text(loadGrade[index]))))),
    //   type(
    //       2,
    //       true,
    //       const Text('About You',
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    //   gridTile(
    //       context,
    //       Text('Title'),
    //       dropdownField(
    //           items: List.generate(
    //               title.length,
    //               (index) => DropdownMenuItem(
    //                   value: title[index],
    //                   alignment: Alignment.center,
    //                   child: Text(title[index]))))),
    //   gridTile(context, Text('Full Name'), textfield()),
    //   gridTile(context, Text('Age'), textfield()),
    //   gridTile(
    //       context,
    //       Text('Marital Status'),
    //       dropdownField(
    //           items: List.generate(
    //               maritalStatus.length,
    //               (index) => DropdownMenuItem(
    //                   value: maritalStatus[index],
    //                   alignment: Alignment.center,
    //                   child: Text(maritalStatus[index]))))),
    //   gridTile(context, Text('Email Address'), textfield()),
    //   gridTile(context, Text('Mobile Number'), textfield()),
    //   gridTile(
    //       context,
    //       Text('Residential Status'),
    //       dropdownField(
    //           items: List.generate(
    //               residentialStatus.length,
    //               (index) => DropdownMenuItem(
    //                   value: residentialStatus[index],
    //                   alignment: Alignment.center,
    //                   child: Text(residentialStatus[index]))))),
    //   type(
    //       2,
    //       true,
    //       const Text('Your Employment',
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    //   gridTile(
    //       context,
    //       Text('Employment Status'),
    //       dropdownField(
    //           items: List.generate(
    //               employmentStatus.length,
    //               (index) => DropdownMenuItem(
    //                   value: employmentStatus[index],
    //                   alignment: Alignment.center,
    //                   child: Text(employmentStatus[index]))))),
    //   // Need change Datetime
    //   gridTile(context, Text('When did you work at current employment?'),
    //       textfield()),
    //   //
    //   gridTile(
    //       context,
    //       Text('When do you get paid?'),
    //       dropdownField(
    //           items: List.generate(
    //               paidPeriod.length,
    //               (index) => DropdownMenuItem(
    //                   value: paidPeriod[index],
    //                   alignment: Alignment.center,
    //                   child: Text(paidPeriod[index]))))),
    //   type(
    //       2,
    //       true,
    //       const Text('Your Finances',
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    //   gridTile(
    //       context, Text('What is your monthly income after tax?'), textfield()),
    //   gridTile(
    //       context, Text('What is your monthly mortgage or rent?'), textfield()),
    //   gridTile(context, Text('How many children or dependents do you have?'),
    //       textfield()),
    //   gridTile(context, Text('Person default'), textfield()),
    //   gridTile(context, Text('Credit history length'), textfield()),
    // ],
  );
}

// mapping creditamount REVERSE index
List<String> creditamount = [
  'Below £2,000',
  '£2,001 - £4,000',
  '£4,001 - £6,000',
  '£6,001 - £8,000',
  '£8,001 - £10,000',
  '£10,001 - £12,000',
  '£12,001 - £14,000',
  '£14,001 - £16,000',
  '£16,001 - £18,000',
  'Above £18,001',
];

// mapping duration REVERSE index
List<String> duration = [
  'Below 5 months',
  '6 to 10 months',
  '11 to 15 months',
  '16 to 20 months',
  '21 to 25 months',
  '26 to 30 months',
  '31 to 35 months',
  '36 to 40 months',
  '41 to 45 months',
  '46 to 50 months',
  '51 to 55 months',
  '56 to 60 months',
  // '61 - 65',
  // '66 - 70',
  // '71 - 75',
  // '76+',
];

List<String> purpose = [
  'radio_television',
  'car_new',
  'car_used',
  'furniture_equipment',
  'business',
  'education',
  'repairs',
  'domestic_appliances',
  'retraining',
  'others',
];

// mapping disposible index
List<String> disposible = [
  'Below £2,000',
  '£2,001 - £4,000',
  '£4,001 - £6,000',
  '£6,001 - £8,000',
  '£8,001 - £10,000',
  '£10,001 - £12,000',
  '£12,001 - £14,000',
  '£14,001 - £16,000',
  '£16,001 - £18,000',
  'Above £18,001',
];

// mapping occupation REVERSE index
List<String> occupation = [
  'Management/Selfemployed',
  'Skilled Employee/official',
  'Unskilled resident',
  'Unemployed',
  // 'unemployed_unskilled_nonresident',
  // 'unskilled_resident',
  // 'skilledEmployee_or_official',
  // 'management_or_selfEmployed_or_highlyQualifiedEmployee',
];

// mapping employmentLength index
List<String> employmentLength = [
  'Less than 1 year',
  '1 to 4 years',
  '4 to 7 years',
  'More than 7 years',

  // 'Less_than_1_year',
  // 'one_4_years',
  // 'four_7_years',
  // 'More_than_7_years',
];
List<String> otherDebtorsGuarantors = [
  'co_applicant',
  'guarantor',
  'none',
];
List<String> housing = [
  'own',
  'rent',
  'for_free',
];
List<String> residenceLength = [
  'one_year_or_less',
  'two_years',
  'three_years',
  'More_than_4_years'
];
List<String> ageGroup = [
  '18 to 25',
  '26 to 30',
  '31 to 35',
  '36 to 40',
  '41 to 45',
  '46 to 50',
  '51 to 55',
  '56 to 60',
  '61 to 65',
  '66 to 70',
  '71 to 75',
];

// mapping numberOfDependents index
List<String> numberOfDependents = [
  '1 child',
  '2 children or more',
];




// Sample
// List<String> loadGrade = [
//   'Grade A',
//   'Grade B',
//   'Grade C',
//   'Grade D',
//   'Grade E',
//   'Grade F',
//   'Grade G',
// ];

// List<String> title = [
//   'Mr',
//   'Mrs',
//   'Miss',
//   'Ms',
// ];

// List<String> maritalStatus = [
//   'Civil Partnership',
//   'Divorced',
//   'Living with Parents',
//   'Married',
//   'Separated',
//   'Single',
//   'Widow / Widower',
//   'Other',
// ];

// List<String> residentialStatus = [
//   'Homeowner',
//   'Council Tenant',
//   'Living with Parents',
//   'Private Tenant',
//   'Shared Ownership Scheme',
//   'Other'
// ];

// List<String> employmentStatus = [
//   'Employed Full-time',
//   'Employed Part-time',
//   'Full-time Carer',
//   'Self Employed',
//   'Retired',
//   'Semi Retired',
//   'Student',
//   'Unemployed'
// ];

// List<String> paidPeriod = [
//   'Monthly',
//   'Four Weekly',
//   'Fortnightly',
//   'Weekly',
//   'Other'
// ];
