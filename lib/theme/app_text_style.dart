import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleFigma on TextStyle {
  TextStyle withLineHeight(double fontSize, double lineHeight) {
    final heightFactor = lineHeight / fontSize;
    return copyWith(
      fontSize: fontSize.sp,
      height: heightFactor,
    );
  }

  TextStyle withLetterSpacing(double perc) {
    return fontSize != null
        ? copyWith(letterSpacing: (fontSize! * (perc / 100)))
        : this;
  }

  TextStyle get latoFont => copyWith(fontFamily: 'Lato');
  TextStyle get garamondFont => copyWith(fontFamily: 'Garamond');
}

class AppTextStyle {
  // Headline Large
  static TextStyle headlineLarge = TextStyle(
    fontWeight: FontWeight.w500,
  ).withLineHeight(32, 40).withLetterSpacing(0);

  // Title Large
  static TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.w500,
  ).withLineHeight(22, 28).withLetterSpacing(0);

  // Body Large
  static TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w400,
  ).withLineHeight(16, 24).withLetterSpacing(0.5);

  // Body Medium Bold
  static TextStyle bodyMediumBold = TextStyle(
    fontWeight: FontWeight.w700,
  ).withLineHeight(14, 21).withLetterSpacing(0.4);

  // Button Large
  static TextStyle buttonLarge = TextStyle(
    fontWeight: FontWeight.w600,
  ).withLineHeight(16, 24).withLetterSpacing(0.1);

  // Body Small
  static TextStyle bodySmall = TextStyle(
    fontWeight: FontWeight.w400,
  ).withLineHeight(12, 16).withLetterSpacing(0.4);

  // Lato 16-400
  static TextStyle lato16400 = TextStyle(fontWeight: FontWeight.w400)
      .withLineHeight(16, 16)
      .withLetterSpacing(0)
      .latoFont;
}
