import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget _productCard(
        {required String title,
        required String description,
        required String sub}) {
      return InkWell(
        onTap: () {},
        child: Container(
          width: width / 2.5,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black12),
          child: Column(
            children: [
              Container(
                  // color: Colors.red,
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
              Divider(
                color: Colors.black,
              ),
              Container(
                  // color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Center(
                    child: Text(
                      description,
                      maxLines: context.responsive(xs: 1, lg: 3),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  )),
              Container(
                  // color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Center(
                    child: Text(
                      sub,
                      maxLines: context.responsive(xs: 1, lg: 3),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  )),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Our products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              direction:
                  context.responsive(xs: Axis.horizontal, lg: Axis.vertical),
              children: [
                _productCard(
                  title: 'Repayment calculator',
                  description:
                      'Try our repayment calculator to work out how much you would like to borrow.',
                  sub:
                      'Results are based on representative APR and your actual rates and repayments might differ.',
                ),
                _productCard(
                  title: 'Loan recommender',
                  description:
                      'Our loan recommender tool searches for the best loans for you so you don’t have to.',
                  sub:
                      'Recommended loans are based on loans available at a point in time and may change.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
