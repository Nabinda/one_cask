import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final double? height;
  final double? width;
  final BlendMode? colorBlendMode;
  final Color? color;
  const AppIcon({
    super.key,
    required this.icon,
    this.size,
    this.height,
    this.color,
    this.colorBlendMode,
    this.width,
  }) : assert(
            (size != null && height == null && width == null) ||
                (size == null && height == null && width == null) ||
                (size == null && height != null && width != null),
            'If size is provided, height and width should be null. If size is null, both height and width should be either null or non-null.');

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      color: color,
      colorBlendMode: colorBlendMode,
      height: (size ?? height)?.sp,
      width: (size ?? width)?.sp,
    );
  }
}
