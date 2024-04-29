import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/themes.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<String> companies = [
  'Company',
  'About Us',
  'Careers',
  'Our News',
  'Contact Us'
];
List<String> pages = [
  'Pages',
  'Loan Eligibility',
  'Repayment Calculator',
  'Guides',
  'News',
];
List<String> terms = [
  'Terms & Conditions',
  'Terms of Use',
  'FCSC Information',
  'Privacy Ntice',
  'Cookie Notice',
];

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget textfield({required String placeholder, required bool isBox}) {
      return Container(
        width: context.responsive(xs: 300, sm: isBox ? 600 : 300),
        child: TextField(
          maxLines: isBox ? 3 : 1,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      );
    }

    Widget textOnly({required String text, required bool isTitle}) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: context.responsive(xs: 5, sm: 10)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: isTitle ? 20 : 14,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
        ),
      );
    }

    Widget part(List<String> list) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: context.responsive(xs: 10, sm: 30)),
        child: Column(
          children: [
            textOnly(text: list[0], isTitle: true),
            Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                direction:
                    context.responsive(xs: Axis.horizontal, sm: Axis.vertical),
                children: List.generate(
                    list.length - 1,
                    (index) =>
                        textOnly(text: list[index + 1], isTitle: false))),
          ],
        ),
      );
    }

    Widget _footer() {
      return Flex(
        direction: context.responsive(xs: Axis.vertical, sm: Axis.horizontal),
        children: [
          Expanded(flex: 2, child: part(companies)),
          Expanded(flex: 2, child: part(pages)),
          Expanded(flex: 2, child: part(terms)),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: context.responsive(xs: 10, sm: 30)),
              child: Column(children: [
                textOnly(text: 'Newletters', isTitle: true),
                textOnly(
                    text: 'Sign up for updates and stay connected',
                    isTitle: false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: context.responsive(xs: 200, sm: 160, md: 250),
                        child: textfield(
                            placeholder: 'Enter your email', isBox: false)),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Subscribe'),
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                    visible: context.responsive(xs: false, sm: true),
                    child: Flex(
                      direction: context.responsive(
                          xs: Axis.vertical, lg: Axis.horizontal),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'images/logo-1.png',
                            height: 60,
                          ),
                        ),
                        Image.asset(
                          'images/logo-2.png',
                          height: 60,
                        ),
                      ],
                    ))
              ]),
            ),
          ),
        ],
      );
    }

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
                // color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: width / 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Contact us',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                        'Have a question or feedback?\nFind your answers in our FAQs or leave us a message!'),
                    Flex(
                      mainAxisSize: MainAxisSize.min,
                      direction: context.responsive(
                          xs: Axis.vertical, sm: Axis.horizontal),
                      children: [
                        textfield(placeholder: 'Name', isBox: false),
                        SizedBox(
                          width: 10,
                          height: 20,
                        ),
                        textfield(placeholder: 'Email', isBox: false),
                      ],
                    ),
                    textfield(placeholder: 'Enter message...', isBox: true),
                    TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text('Submit'),
                      ),
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black38),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF101424),
              child: _footer(),
            ),
          )
        ],
      ),
    );
  }
}
