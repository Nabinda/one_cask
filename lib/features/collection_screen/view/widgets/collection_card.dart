import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/app_routes/app_routes.gr.dart';
import 'package:pixelfield/features/collection_screen/data/model/collection_data_model.dart';
import 'package:pixelfield/features/components/widgets/image_builder.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class CollectionCard extends StatelessWidget {
  final CollectionDataModel item;
  const CollectionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.id != null) {
          context.router.push(CollectionDetailScreen(id: item.id!));
        } else {
          // Handle if data id is null
        }
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
                child: ImageBuilder(
                  imageUrl: item.imageUrl ?? '',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${item.name} #${item.code}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.titleLarge
                        .copyWith(color: Palette.greyEA)
                        .garamondFont,
                  ),
                  Gap(4.h),
                  Text(
                    item.bottleNumber ?? 'N/A',
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
