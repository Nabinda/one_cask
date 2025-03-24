// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:pixelfield/features/auth_screen/view/sign_in_screen.dart'
    as _i1;
import 'package:pixelfield/features/splash_screen/view/splash_screen.dart'
    as _i2;

/// generated route for
/// [_i1.SignInScreen]
class SignInScreen extends _i3.PageRouteInfo<void> {
  const SignInScreen({List<_i3.PageRouteInfo>? children})
    : super(SignInScreen.name, initialChildren: children);

  static const String name = 'SignInScreen';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.SignInScreen();
    },
  );
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreen extends _i3.PageRouteInfo<void> {
  const SplashScreen({List<_i3.PageRouteInfo>? children})
    : super(SplashScreen.name, initialChildren: children);

  static const String name = 'SplashScreen';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashScreen();
    },
  );
}
