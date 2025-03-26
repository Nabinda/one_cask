import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pixelfield/theme/palette.dart';

class ImageBuilder extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxShape shape;
  final Border? border;
  final BorderRadius? borderRadius;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;

  const ImageBuilder(
      {super.key,
      required this.imageUrl,
      this.fit = BoxFit.cover,
      this.width,
      this.height,
      this.color,
      this.backgroundColor,
      this.padding,
      this.borderRadius,
      this.placeholder,
      this.errorWidget,
      this.border,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Container(
        padding: padding,
        width: width?.sp,
        height: height?.sp,
        clipBehavior: Clip.hardEdge,
        foregroundDecoration: BoxDecoration(shape: shape, border: border),
        decoration:
            BoxDecoration(shape: shape, color: backgroundColor, border: border),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          color: color,
          placeholder: placeholder ??
              (context, url) => ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: height ?? 150.0, minWidth: width ?? 100),
                    child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: Palette.orange00,
                          size: (height != null) ? height! / 5 : 20),
                    ),
                  ),
          errorWidget: errorWidget ??
              (context, url, error) => Center(
                    child: Icon(Icons.error, color: Colors.red),
                  ),
        ),
      ),
    );
  }
}
