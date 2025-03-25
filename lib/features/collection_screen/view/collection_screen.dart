import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.55),
      itemBuilder: (context, index) => DecoratedBox(
        decoration: BoxDecoration(color: Palette.darkGreen29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 0.75,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                child: Image.network(
                    'https://cdn.prod.website-files.com/66e16aa4cb8ec83d74f0c387/67236ffcadcda20b21cbc31b_Highlandpark-bottle-cutout-dark-edited%5B45%5D.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Springbank 1992 #1234',
                    style: AppTextStyle.titleLarge
                        .copyWith(color: Palette.greyEA)
                        .garamondFont,
                  ),
                  Gap(4),
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
