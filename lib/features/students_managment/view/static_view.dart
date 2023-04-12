import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';
import 'package:labbaik/shared/widgets/gradient_text.dart';


class ReportCard extends StatelessWidget {
  const ReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 28, 29, 33),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey[800], shape: BoxShape.circle),
                child: const Icon(
                  CupertinoIcons.chart_bar_alt_fill,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: EdgeInsets.all(2.0.wp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'Report Summary',
                      style: GoogleFonts.spaceGrotesk(
                          textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                      gradient: const LinearGradient(colors: [
                        Colors.grey,
                        Color.fromARGB(255, 57, 57, 63),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GradientText(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 66, 92, 99),
                        Color.fromARGB(255, 250, 237, 234),
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
    Positioned(
      bottom: 15,
      right: 15,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 252, 122, 122),
            borderRadius: BorderRadius.circular(15)),
        child: const Icon(
          CupertinoIcons.arrow_turn_left_down,
          color: Colors.white,
          size: 19,
        ),
      ),
    ),
      ],
    );
  }
}
