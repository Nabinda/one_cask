import 'package:flutter/material.dart';

extension ResponsiveHelper on BuildContext {
  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// Returns ratio of device
  double get ratio => mq.size.aspectRatio;

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * widthPx;

  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * heightPx;

  /// Returns same as MediaQuery.of(context).size
  EdgeInsets get viewPadding => mq.viewPadding;
}
