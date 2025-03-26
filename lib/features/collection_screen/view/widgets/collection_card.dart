import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/app_routes/app_routes.gr.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(CollectionDetailScreen(id: 0));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(color: Palette.darkGreen29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 0.75,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 26, horizontal: 24).r,
                child: Image.network(
                    'https://cdn.prod.website-files.com/66e16aa4cb8ec83d74f0c387/67236ffcadcda20b21cbc31b_Highlandpark-bottle-cutout-dark-edited%5B45%5D.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Springbank 1992 #1234',
                    style: AppTextStyle.titleLarge
                        .copyWith(color: Palette.greyEA)
                        .garamondFont,
                  ),
                  Gap(4.h),
                  Text(
                    '112/158',
                    style: AppTextStyle.bodySmall
                        .copyWith(color: Palette.greyD1)
                        .latoFont,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
