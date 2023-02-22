import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyTotalCard extends StatelessWidget {
  final double amount;
  const MyTotalCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 8 - 16,
      left: 16.0,
      child: MaterialButton(
        onPressed: () {},
        color: AppColorsTheme.white,
        height: 100,
        minWidth: MediaQuery.of(context).size.width - 32.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   texts.home.total(
            //     month: DateFormat('MMMM').format(
            //       DateTime.now(),
            //     ),
            //   ),
            //   style: GoogleFonts.ubuntu(
            //     color: AppColorsTheme.kPink,
            //     fontSize: 24.0,
            //   ),
            // ),
            Text(
              DateFormat('MMMM')
                  .format(
                    DateTime.now(),
                  )
                  .toUpperCase(),
              style: GoogleFonts.ubuntu(
                color: AppColorsTheme.kPink,
                fontSize: 24.0,
                letterSpacing: 12,
              ),
            ),
            Text(
              'Total',
              style: GoogleFonts.ubuntu(
                color: AppColorsTheme.kPink,
                // fontSize: 24.0,

                letterSpacing: 8,
              ),
            ),
            RichText(
              text: TextSpan(
                text: NumberFormat.currency().format(amount),
                style: GoogleFonts.ubuntu(
                  color: AppColorsTheme.kPink,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
