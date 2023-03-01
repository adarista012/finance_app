import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TweenAnimationName extends StatelessWidget {
  final String text;
  final bool isLeft;
  const TweenAnimationName({
    super.key,
    required this.text,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return isLeft
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(
                begin: MediaQuery.of(context).size.width,
                end: (MediaQuery.of(context).size.width / 2)),
            duration: const Duration(milliseconds: 1240),
            builder: (_, d, __) {
              return Positioned(
                right: d,
                child: Text(
                  text,
                  style: GoogleFonts.ubuntu(
                    color: AppColorsTheme.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 12,
                  ),
                ),
              );
            },
          )
        : TweenAnimationBuilder<double>(
            tween: Tween<double>(
                begin: MediaQuery.of(context).size.width,
                end: (MediaQuery.of(context).size.width / 2)),
            duration: const Duration(milliseconds: 1240),
            builder: (_, d, __) {
              return Positioned(
                left: d,
                child: Text(
                  text,
                  style: GoogleFonts.ubuntu(
                    color: AppColorsTheme.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 12,
                  ),
                ),
              );
            },
          );
  }
}
