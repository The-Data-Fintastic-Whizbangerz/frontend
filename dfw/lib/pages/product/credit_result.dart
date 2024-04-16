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
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(20),
              child: AnimatedRadialGauge(
                /// The animation duration.
                duration: const Duration(seconds: 1),
                curve: Curves.elasticOut,

                /// Gauge value.
                value: widget.score,
                builder: (context, child, value) => RadialGaugeLabel(
                  value: value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                axis: GaugeAxis(
                  min: 0,
                  max: 1000,
                  degrees: 300,
                  style: const GaugeAxisStyle(
                    thickness: 50,
                    background: Colors.white,
                    segmentSpacing: 5,
                  ),
                  progressBar: const GaugeProgressBar.basic(
                    color: Colors.transparent,
                  ),

                  /// Define the pointer that will indicate the progress (optional).
                  pointer: GaugePointer.triangle(
                    width: 25,
                    height: width / 15,
                    position: GaugePointerPosition.surface(
                        offset: Offset(0, width / 30)),
                    color: Color(0xFF193663),
                  ),

                  /// Define axis segments (optional).
                  segments: [
                    const GaugeSegment(
                      from: 0,
                      to: 200,
                      color: Colors.red,
                      cornerRadius: Radius.zero,
                    ),
                    const GaugeSegment(
                      from: 200,
                      to: 400,
                      color: Colors.orange,
                      cornerRadius: Radius.zero,
                    ),
                    const GaugeSegment(
                      from: 400,
                      to: 600,
                      color: Colors.yellow,
                      cornerRadius: Radius.zero,
                    ),
                    const GaugeSegment(
                      from: 600,
                      to: 800,
                      color: Colors.green,
                      cornerRadius: Radius.zero,
                    ),
                    const GaugeSegment(
                      from: 800,
                      to: 1000,
                      color: Color.fromARGB(255, 3, 104, 6),
                      cornerRadius: Radius.zero,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
