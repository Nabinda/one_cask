import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/theme/palette.dart';

class LoadingShimmerHelper extends StatelessWidget {
  final EdgeInsets? margin;
  final double? height;
  const LoadingShimmerHelper({super.key, this.margin, this.height});

  @override
  Widget build(BuildContext context) {
    return CardLoading(
      margin: margin,
      height: (height ?? 100).h,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      cardLoadingTheme: CardLoadingTheme(
          colorOne: Palette.darkGreen19, colorTwo: Palette.darkGreen29),
    );
  }
}
