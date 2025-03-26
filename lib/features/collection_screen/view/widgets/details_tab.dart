import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            child: Text(
              'Distillery',
              style:
                  AppTextStyle.bodyLarge.latoFont.copyWith(color: Colors.white),
            ),
          ),
          Text(
            'Text',
            style:
                AppTextStyle.bodyLarge.latoFont.copyWith(color: Palette.greyBF),
          )
        ],
      ),
      separatorBuilder: (context, index) => Gap(16.h),
      itemCount: 10,
    );
  }
}
