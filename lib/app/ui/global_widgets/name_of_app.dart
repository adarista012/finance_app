import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameOfApp extends StatelessWidget {
  const NameOfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstants.nameOfApp,
      style: GoogleFonts.ubuntu(
        color: AppColorsTheme.kPink,
        fontSize: 36,
        fontWeight: FontWeight.w900,
        letterSpacing: 12,
        shadows: [
          Shadow(
            color: AppColorsTheme.grey,
            blurRadius: 16,
            offset: const Offset(
              0,
              8.0,
            ),
          ),
        ],
      ),
    );
  }
}
