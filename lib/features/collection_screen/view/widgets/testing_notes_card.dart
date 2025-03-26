import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class TestingNotesCard extends StatelessWidget {
  const TestingNotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Palette.darkGreen21),
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nose',
              style: AppTextStyle.titleLarge.garamondFont
                  .copyWith(color: Palette.greyEA),
            ),
            Gap(4.h),
            ...List.generate(
              3,
              (index) => Text(
                'Description',
                style: AppTextStyle.bodyLarge.latoFont
                    .copyWith(color: Palette.greyEA),
              ),
            )
          ],
        ),
      ),
    );
  }
}
