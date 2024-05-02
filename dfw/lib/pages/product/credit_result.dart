import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

import '../../base/routes/route_bloc.dart';
import '../guide/guide_page.dart';

class CreditResult extends StatefulWidget {
  CreditResult({
    Key? key,
  }) : super(key: key);

  @override
  State<CreditResult> createState() => _CreditResultState();
}

class _CreditResultState extends State<CreditResult> {
  double score = 0;
  @override
  void dispose() {
    super.dispose();
  }

  Widget _scoreUnderstanding() {
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      // insetPadding: EdgeInsets.all(20),
      child: Container(
        width: width / 2.5,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How does my score mean?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  maxLines: context.responsive(xs: 2, lg: 3),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  "Your credit score is calculated by analysing your credit history and looks at things like whether you've made your payments on time, how much of your available credit is used, and how old your accounts are."),
              Divider(color: Colors.red, thickness: 5),
              Text(
                'Poor (300-450)',
                style: TextStyle(
                  height: 1.25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  "While you won't be completely frozen out from getting credit if you need it, you'll have a limited number of lenders to choose from. It's likely you'll only be able to borrow small amounts of money and will be charged high interest rates."),
              Divider(color: Colors.orange, thickness: 5),
              Text(
                'Fair (450-600)',
                style: TextStyle(
                  height: 1.25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  "You'll have a few credit providers to choose from if you need to borrow money, but may find your choice is quite limited. You may only be able to borrow small amounts of money at high interest rates."),
              Divider(color: Colors.lightGreen, thickness: 5),
              Text(
                'Good (600-750)',
                style: TextStyle(
                  height: 1.25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  "If you need credit, you'll have a number of different providers to choose from. While you may have some offers and deals available, it's unlikely that you'll be eligible for the biggest loans."),
              Divider(color: Colors.green, thickness: 5),
              Text(
                'Excellent (750-900)',
                style: TextStyle(
                  height: 1.25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  "People with scores in this range typically experience easy approval processes when applying for new credit, and they are likely to be offered the best available lending terms, including the lowest interest rates and fees."),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<RouteBloc, RouteState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Product_RouteState) {
          score = state.result;
        }
        // context.read<RouteBloc>().add(
        //     Guide_RouteEvent(crossAxisCount: context.responsive(xs: 3, sm: 2)));
        return Scaffold(
          body: Flex(
            direction:
                context.responsive(xs: Axis.vertical, lg: Axis.horizontal),
            children: [
              Expanded(
                child: Container(
                  child: ProductList(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width / 1.6,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          'Now that you know that you will most probably qualify for a loan, check out our helpful products and guides below to select the best loan available for you!'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedRadialGauge(
                            /// The animation duration.
                            duration: const Duration(seconds: 1),
                            curve: Curves.elasticOut,
                            radius: width /
                                context.responsive(
                                    xs: 9, sm: 12, md: 18, lg: 10),

                            /// Gauge value.
                            value: score,
                            builder: (context, child, value) =>
                                RadialGaugeLabel(
                              value: value,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width /
                                    context.responsive(
                                        xs: 30, sm: 40, md: 60, lg: 25),
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            axis: GaugeAxis(
                              min: 300,
                              max: 900,
                              degrees: 270,
                              style: GaugeAxisStyle(
                                thickness: width /
                                    context.responsive(
                                        xs: 20, sm: 25, md: 40, lg: 30),
                                background: Colors.white,
                                segmentSpacing: 5,
                              ),
                              progressBar: const GaugeProgressBar.basic(
                                color: Colors.transparent,
                              ),

                              /// Define the pointer that will indicate the progress (optional).
                              pointer: GaugePointer.triangle(
                                width: width /
                                    context.responsive(
                                        xs: 40, sm: 50, md: 80, lg: 60),
                                height: height /
                                    context.responsive(xs: 20, md: 18, lg: 10),
                                position: GaugePointerPosition.surface(
                                    offset: Offset(
                                        0,
                                        width /
                                            context.responsive(
                                                xs: 80, md: 100, lg: 60))),
                                color: Color(0xFF193663),
                              ),

                              /// Define axis segments (optional).
                              segments: [
                                const GaugeSegment(
                                  from: 300,
                                  to: 450,
                                  color: Colors.red,
                                  cornerRadius: Radius.zero,
                                ),
                                const GaugeSegment(
                                  from: 450,
                                  to: 600,
                                  color: Colors.orangeAccent,
                                  cornerRadius: Radius.zero,
                                ),
                                const GaugeSegment(
                                  from: 600,
                                  to: 750,
                                  color: Colors.lightGreen,
                                  cornerRadius: Radius.zero,
                                ),
                                const GaugeSegment(
                                  from: 750,
                                  to: 900,
                                  color: Colors.green,
                                  cornerRadius: Radius.zero,
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'You are ',
                                  style: TextStyle(
                                    fontSize: width /
                                        context.responsive(
                                            xs: 35, sm: 50, md: 60, lg: 80),
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${(score / 900 * 100).round()}% ',
                                  style: TextStyle(
                                    fontFamily: "Arial",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 30,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' likely to be accepted for your loan application',
                                  style: TextStyle(
                                    fontSize: width /
                                        context.responsive(
                                            xs: 35, sm: 50, md: 60, lg: 80),
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return _scoreUnderstanding();
                            },
                          );
                        },
                        child: Text('Understand this score?')),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: GuideWidget(
                    crossAxisCount: context.responsive(xs: 2, md: 4, lg: 2),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
