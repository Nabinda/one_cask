import 'package:flutter/material.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CustomFilledButton(
      {super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
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
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyle.buttonLarge
              .copyWith(color: Palette.title19)
              .garamondFont,
        ),
      ),
    );
  }
}
