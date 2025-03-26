import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/features/components/widgets/app_icon.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final EdgeInsets? padding;
  final String? icon;
  const CustomFilledButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.padding,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16).r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Palette.orange00,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.black.withValues(alpha: 0.25))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              AppIcon(icon: icon!, size: 24),
              Gap(8.w),
            ],
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppTextStyle.buttonLarge
                  .copyWith(color: Palette.title19)
                  .garamondFont,
            ),
          ],
        ),
      ),
    );
  }
}
