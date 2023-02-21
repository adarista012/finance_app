import 'dart:ui';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:flutter/material.dart';

List<TweenAnimationBuilder<double>> listTweens = [
  TweenAnimationBuilder<double>(
    tween: Tween<double>(begin: 0, end: 12),
    duration: const Duration(seconds: 3),
    builder: (_, d, __) {
      return Positioned(
        top: 10 * d,
        left: 20,
        child: Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            color: AppColorsTheme.kPink.shade100.withOpacity(0.24),
            shape: BoxShape.circle,
          ),
        ),
      );
    },
  ),
  TweenAnimationBuilder(
    tween: Tween<double>(begin: 0, end: 12),
    duration: const Duration(seconds: 3),
    builder: (_, d, __) {
      return Positioned(
        top: 120,
        right: 12 * d,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColorsTheme.kPink.withOpacity(0.24),
            shape: BoxShape.circle,
          ),
        ),
      );
    },
  ),
  TweenAnimationBuilder(
    tween: Tween<double>(begin: 0, end: 12),
    duration: const Duration(seconds: 3),
    builder: (_, d, __) {
      return Positioned(
        top: 20 * d,
        right: 10 * d,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            height: 240,
            width: 240,
            decoration: BoxDecoration(
              color: AppColorsTheme.kPink.withAlpha(160),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    },
  ),
  TweenAnimationBuilder(
    tween: Tween<double>(begin: 0, end: 12),
    duration: const Duration(seconds: 3),
    builder: (_, d, __) {
      return Positioned(
        top: 20 * d,
        right: 0 * d,
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: AppColorsTheme.kPink,
            shape: BoxShape.circle,
          ),
        ),
      );
    },
  ),
  TweenAnimationBuilder(
    tween: Tween<double>(begin: 0, end: 12),
    duration: const Duration(seconds: 3),
    builder: (_, d, __) {
      return Positioned(
        bottom: 10 * d,
        left: 20 * d,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColorsTheme.kPink.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    },
  ),
  // TweenAnimationBuilder(
  //   tween: Tween<double>(begin: 0, end: 12),
  //   duration: const Duration(seconds: 0),
  //   builder: (_, d, __) {
  //     return Container(
  //       alignment: Alignment.center,
  //       child: Text(
  //         AppConstants.nameOfApp,
  //         style: GoogleFonts.ubuntu(
  //           color: AppColorsTheme.kPink,
  //           fontSize: 48,
  //           fontWeight: FontWeight.bold,
  //           shadows: [
  //             Shadow(
  //                 color: AppColorsTheme.grey,
  //                 blurRadius: 16,
  //                 offset: const Offset(0, 8.0)),
  //           ],
  //         ),
  //       ),
  //     );
  //   },
  // ),
];
