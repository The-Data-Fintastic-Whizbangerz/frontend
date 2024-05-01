import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/string.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/base/routes/route_repository.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/credit_result.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/service/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/models/creditForm.dart';
import '../../base/routes/route_bloc.dart';
import '../../base/routes/route_initial.dart';
import '../../base/routes/route_type.dart';
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
    // creditamount: 0,
    // duration: 0,
    // purpose: 'purpose',
    // disposible: 0,
    // occupation: 0,
    // employLength: 0,
    // guarantor: 'guarantor',
    // house: 'house',
    // residentLength: 'residentLength',
    // ageGroup: 0,
    // numChild: 0
    );

class _ProductWidgetState extends State<ProductWidget> {
  final ScrollController _controller = ScrollController();
  late bool isScrollEnd = false;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<RouteType?> guest_notifier = ValueNotifier(null);

  final level_guest = RouteRepository.routes
      .where((route) => route.level == RouteLevel.guest)
      .toList();

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
        direction: context.responsive(xs: Axis.vertical, sm: Axis.horizontal),
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
                    'At CreditWise, safeguarding your data privacy is paramount. We will not save or utilise any personal details provided for any purposes beyond what is intended. We are committed to ensuring your information remains secure and confidential.',
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
                          child: _form()),
                    ),
                  ),
                ),
                _submit(),
                // if (result != null)
                //   Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Text(result!),
                //   )

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

  Widget _form() {
    return Form(
      key: _formKey,
      child: StaggeredGrid.count(
        crossAxisCount: 1,
        mainAxisSpacing: context.responsive(xs: 1, sm: 10),
        children: [
          gridTile(
              context,
              Text('What is the amount that you are looking to borrow?'),
              dropdownField(
                  items: List.generate(
                      creditAmount.length,
                      (index) => DropdownMenuItem(
                          value: creditAmount[index],
                          alignment: Alignment.center,
                          child: Text(creditAmount[index]),
                          onTap: () => creditForm.setCreditAmount =
                              creditAmount.length - index)))),
          gridTile(
              context,
              Text(
                  'How many installments(in months) do you require to pay back the loan?'),
              dropdownField(
                  items: List.generate(
                      duration.length,
                      (index) => DropdownMenuItem(
                          value: duration[index],
                          alignment: Alignment.center,
                          child: Text(duration[index]),
                          onTap: () => creditForm.setDuration =
                              duration.length - index)))),
          gridTile(
              context,
              Text('Reason for needing a loan?'),
              dropdownField(
                  items: List.generate(
                      purpose.length,
                      (index) => DropdownMenuItem(
                          value: purpose[index],
                          alignment: Alignment.center,
                          child: Text(purpose[index]
                              .replaceAll(RegExp('_'), ' ')
                              .toCapitalise()),
                          onTap: () =>
                              creditForm.setPurpose = purpose[index])))),
          gridTile(
              context,
              Text(
                  'What is your monthly income after essential costs such as rent/mortgage, bill, and car etc?'),
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
              Text(
                  'Do you currently have any other loans that you are paying back?'),
              dropdownField(
                  items: List.generate(
                      numExistCredit.length,
                      (index) => DropdownMenuItem(
                          value: numExistCredit[index],
                          alignment: Alignment.center,
                          child: Text(numExistCredit[index]),
                          onTap: () => creditForm.setNumExistCredit =
                              numExistCredit.length - index)))), // Check?
          gridTile(
              context,
              Text('What is the status of your current main bank account?'),
              dropdownField(
                  items: List.generate(
                      statusExistCredit.length,
                      (index) => DropdownMenuItem(
                          value: statusExistCredit[index],
                          alignment: Alignment.center,
                          child: Text(statusExistCredit[index]),
                          onTap: () => creditForm.setStatusExistCredit =
                              statusExistCredit.length - index)))), // Check?
          gridTile(
              context,
              Text('Have you responsibly repaid any loans in the past?'),
              dropdownField(
                  items: List.generate(
                      creditHistory.length,
                      (index) => DropdownMenuItem(
                          value: creditHistory[index],
                          alignment: Alignment.center,
                          child: Text(creditHistory[index]),
                          onTap: () => creditForm.setCreditHistory =
                              creditHistory.length - index)))), // Check?
          gridTile(
              context,
              Text(
                  'Do you currently have any other payment plans with installments due? Credit Cards, Store Cards etc'),
              dropdownField(
                  items: List.generate(
                      isOtherPlans.length,
                      (index) => DropdownMenuItem(
                          value: isOtherPlans[index],
                          alignment: Alignment.center,
                          child: Text(isOtherPlans[index]
                              .replaceAll(RegExp('_'), ' ')
                              .toCapitalise()),
                          onTap: () => creditForm.setIsOtherPlans =
                              isOtherPlans[index])))),
          gridTile(
              context,
              Text('Are you currently employed?'),
              dropdownField(
                  items: List.generate(
                      isEmployed.length,
                      (index) => DropdownMenuItem(
                          value: isEmployed[index],
                          alignment: Alignment.center,
                          child: Text(isEmployed[index]
                              .replaceAll(RegExp('_'), ' ')
                              .toCapitalise()),
                          onTap: () =>
                              creditForm.setIsEmployed = isEmployed[index])))),
          gridTile(
              context,
              Text('How long have you been at your current employment?'),
              dropdownField(
                  items: List.generate(
                      employLength.length,
                      (index) => DropdownMenuItem(
                          value: employLength[index],
                          alignment: Alignment.center,
                          child: Text(employLength[index]),
                          onTap: () => creditForm.setEmployLength =
                              employLength.length - index)))),
          gridTile(
              context,
              Text(
                  'In your current place of residence are you a homeowner, renting, or living there for free?'),
              dropdownField(
                  items: List.generate(
                      housing.length,
                      (index) => DropdownMenuItem(
                          value: housing[index],
                          alignment: Alignment.center,
                          child: Text(housing[index]),
                          onTap: () => creditForm.setHousing =
                              housing.length - index)))),
          gridTile(
              context,
              Text(
                  'How many people are currently dependent on your income for support? Spouses, offspring, live in family'),
              dropdownField(
                  items: List.generate(
                      numChild.length,
                      (index) => DropdownMenuItem(
                          value: numChild[index],
                          alignment: Alignment.center,
                          child: Text(numChild[index]),
                          onTap: () => creditForm.setNumChild =
                              numChild.length - index)))),
        ],
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Require";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.black12, width: 1.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.zero,
      ),
      items: items,
    );
  }

  Widget _submit() {
    return BlocConsumer<RouteBloc, RouteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable: guest_notifier,
          builder: (context, values, child) {
            if (state is Guest_RouteState) {
              guest_notifier = state.notifier;
            }
            return TextButton(
              onPressed: () async {
                // print(creditForm.toJson());
                // ProductRepository.instance.testAPI();

                double result = await ProductRepository.instance.submitData(
                  creditAmount: creditForm.creditAmount,
                  duration: creditForm.duration,
                  purpose: creditForm.purpose,
                  disposible: creditForm.disposible,
                  numExistCredit: creditForm.numExistCredit,
                  statusExistCredit: creditForm.statusExistCredit,
                  creditHistory: creditForm.creditHistory,
                  isOtherPlans: creditForm.isOtherPlans,
                  isEmployed: creditForm.isEmployed,
                  employLength: creditForm.employLength,
                  housing: creditForm.housing,
                  numChild: creditForm.numChild,
                );
                if (_formKey.currentState!.validate()) {
                  guest_notifier.value = RouteType(
                    path: 'products/loan-eligibility-calculator/result',
                    source: RouteSource.fromClick,
                  );

                  context.read<RouteBloc>().add(Product_RouteEvent(
                        notifier: guest_notifier,
                        result: result,
                      ));
                  print('PAGE CLICK: ${guest_notifier}');
                }
              },
              child: Text('Check my eligibility'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple[400]),
            );
          },
        );
      },
    );
  }
}

Widget gridTile(BuildContext context, Text text, Widget widget) {
  return StaggeredGrid.count(
      crossAxisCount: context.responsive(xs: 1, sm: 2),
      mainAxisSpacing: context.responsive(xs: 1, sm: 100),
      crossAxisSpacing: context.responsive(xs: 0, sm: 20),
      children: [type(1, true, text), type(1, false, widget)]);
}

Widget type(int cross, bool isText, Widget widget) {
  return StaggeredGridTile.fit(
    crossAxisCellCount: cross,
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 40,
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

// mapping creditamount REVERSE index
List<String> creditAmount = [
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
];

List<String> purpose = [
  'electronics',
  'car_new',
  'car_used',
  'furniture_equipment',
  'business',
  'education',
  'Repairs',
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

// return reverse int    | 0 - 4 and more
List<String> numExistCredit = ['4 and more', '3', '2', '1', '0'];
// return reverse int
List<String> statusExistCredit = ['Above zero', 'Below zero', 'None'];
//return reverse int
List<String> creditHistory = [
  'Never taken a loan',
  'All credit paid in full',
  'No missed payments of installements',
  'Delayed paying of installments',
];
List<String> isOtherPlans = ['Yes', 'No'];
List<String> isEmployed = ['Yes', 'No'];

// return reverse int
List<String> employLength = [
  'More than 7 years',
  '4 to 7 years',
  '1 to 4 years',
  'Less than 1 year',
  'Not in employement',
];
// return reverse int
List<String> housing = ['Own', 'Rent', 'Live in for free'];
// return reverse int
List<String> numChild = ['2 or more', 'Only 1 child', 'No dependents'];




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
