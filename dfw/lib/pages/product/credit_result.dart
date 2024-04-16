import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/responsiveContext.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class CreditResult extends StatefulWidget {
  double score;
  CreditResult({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  State<CreditResult> createState() => _CreditResultState();
}

class _CreditResultState extends State<CreditResult> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Flex(
      direction: context.responsive(xs: Axis.vertical, lg: Axis.horizontal),
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),

        Expanded(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: 
                      AnimatedRadialGauge(
                      /// The animation duration.
                      duration: const Duration(seconds: 1),
                      curve: Curves.elasticOut,
                      radius: width / context.responsive(xs: 6, sm:10,md: 8) ,
                                      
                      /// Gauge value.
                      value: widget.score,
                      builder: (context, child, value) => RadialGaugeLabel(
                        value: value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width / context.responsive(xs: 15, sm:20, md: 25),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                                      
                      axis: GaugeAxis(
                        min: 300,
                        max: 900,
                        degrees: 300,
                        style: GaugeAxisStyle(
                          thickness: width / context.responsive(xs: 15, sm:30, md: 25),
                          background: Colors.white,
                          segmentSpacing: 5,
                        ),
                        progressBar: const GaugeProgressBar.basic(
                          color: Colors.transparent,
                        ),
                                      
                        /// Define the pointer that will indicate the progress (optional).
                        pointer: GaugePointer.triangle(
                          width: width / context.responsive(xs: 40, sm:50, md: 50),
                          height: height / context.responsive(xs: 15, md: 15),
                          position: GaugePointerPosition.surface(
                              offset: Offset(0, width / context.responsive(xs: 80, md: 60))),
                          color: Color(0xFF193663),
                        ),
                                      
                        /// Define axis segments (optional).
                        segments: [
                          const GaugeSegment(
                            from: 300,
                            to: 400,
                            color: Colors.red,
                            cornerRadius: Radius.zero,
                          ),
                          const GaugeSegment(
                            from: 400,
                            to: 500,
                            color: Colors.orange,
                            cornerRadius: Radius.zero,
                          ),
                          const GaugeSegment(
                            from: 500,
                            to: 600,
                            color: Colors.yellow,
                            cornerRadius: Radius.zero,
                          ),
                          const GaugeSegment(
                            from: 600,
                            to: 700,
                            color: Colors.green,
                            cornerRadius: Radius.zero,
                          ),
                          const GaugeSegment(
                            from: 700,
                            to: 800,
                            color: Color.fromARGB(255, 3, 104, 6),
                            cornerRadius: Radius.zero,
                          ),
                          const GaugeSegment(
                            from: 800,
                            to: 900,
                            color: Color.fromARGB(255, 3, 104, 97),
                            cornerRadius: Radius.zero,
                          ),
                        ],
                      ), ),),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'You are ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${(widget.score / 900 * 100).round()}%',
                        style: TextStyle(
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 30,
                        ),
                      ),
                      TextSpan(
                        text: ' likely to be accepted for your loan application',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
          ),
        
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
