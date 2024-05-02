import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';

import '../../base/routes/route_bloc.dart';

List<Map<String, dynamic>> guides = [
  {
    'image':
        'https://time.com/personal-finance/static/eae579cd0af2665560dfa3f49bf82ee7/4febf/Increase-credit-score.webp',
    'title': 'How to improve your credit score',
    'description':
        'Unlocking your financial freedom: Our in-house expert provides tips on how to boost your credit score and secure your future',
    'url': 'https://time.com/personal-finance/article/improve-credit-score/',
  },
  {
    'image':
        'https://financial-advice.co.uk/app/uploads/2021/08/Fraud_prevention_MEDIUM.jpg',
    'title': 'Protect yourself from fraud',
    'description':
        'Proven strategies on how to shield against fraudulent activities and identity theft to safeguard your finances',
    'url':
        'https://financial-advice.co.uk/2021/08/how-to-protect-yourself-against-financial-scams-and-fraud-2/',
  },
  {
    'image':
        'https://compasspersonalfinance.com/images/made/images/uploads/general-images/What-does-APR-mean_1120_300_c1.jpg',
    'title': 'APR explained UK credit cards and loans',
    'description':
        'Demystifying APR: Understanding how interest rates impact UK credit cards and loans for informed financial decision making',
    'url': 'https://compasspersonalfinance.com/blog/what-does-apr-mean',
  },
];

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouteBloc, RouteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GuideWidget(
          crossAxisCount: context.responsive(xs: 1, sm: 2, md: 3, lg: 4),
        );
      },
    );
  }
}

class GuideWidget extends StatelessWidget {
  int crossAxisCount;
  GuideWidget({
    Key? key,
    required this.crossAxisCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int crossAxisCount = context.responsive(xs: 1, sm: 2, md: 3, lg: 4);
    return BlocConsumer<RouteBloc, RouteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is Guide_RouteState) {
          crossAxisCount = state.crossAxisCount;
        }
        return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
                  child: Text(
                    'Guides',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: crossAxisCount,
                    // context.responsive(xs: 1, sm: 2, md: 3, lg: 4),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    // maxCrossAxisExtent: 200,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: guides.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(10)),
                                color: Colors.grey,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    guides[index].values.elementAt(0),
                                  ),
                                  // image: AssetImage(
                                  //   'images/guide-1.png',
                                  // ),
                                ),
                              ),
                            ),
                            Container(
                                // color: Colors.red,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 60,
                                child: Center(
                                    child: Text(
                                  guides[index].values.elementAt(1),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ))),
                            Container(
                                // color: Colors.red,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 80,
                                child: Center(
                                    child: Text(
                                  guides[index].values.elementAt(2),
                                ))),
                            InkWell(
                                onTap: () {
                                  print(guides[index].values.elementAt(3));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Read More...'),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
