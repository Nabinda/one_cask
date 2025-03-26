import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/constants/app_icon_constants.dart';
import 'package:pixelfield/features/collection_screen/view/widgets/video_player_widget.dart';
import 'package:pixelfield/features/components/widgets/app_icon.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

import 'testing_notes_card.dart';

class TestingNotesTab extends StatelessWidget {
  const TestingNotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        VideoPlayerWidget(),
        Gap(20.h),
        Text(
          'Tasting Notes',
          style: AppTextStyle.titleLarge
              .copyWith(color: Palette.greyEA)
              .garamondFont,
        ),
        Gap(4.h),
        Text(
          'by Charles MacLean MBE',
          style:
              AppTextStyle.bodyLarge.copyWith(color: Palette.greyBF).latoFont,
        ),
        Gap(12.h),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => TestingNotesCard(),
            separatorBuilder: (context, index) => Gap(8.h),
            itemCount: 3),
        Gap(8.h),
        Row(
          children: [
            Expanded(
              child: Text(
                'Your Notes',
                style: AppTextStyle.titleLarge
                    .copyWith(color: Palette.greyEA)
                    .garamondFont,
              ),
            ),
            AppIcon(
              icon: AppIconConstants.arrowLeft,
              size: 24,
            )
          ],
        ),
        Gap(20.h),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => TestingNotesCard(),
            separatorBuilder: (context, index) => Gap(8.h),
            itemCount: 3),
      ],
    );
  }
}
