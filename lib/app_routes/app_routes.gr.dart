// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:pixelfield/features/auth_screen/view/sign_in_screen.dart'
    as _i3;
import 'package:pixelfield/features/collection_screen/view/collection_detail_screen.dart'
    as _i1;
import 'package:pixelfield/features/dashboard_screen/view/dashboard_screen.dart'
    as _i2;
import 'package:pixelfield/features/splash_screen/view/splash_screen.dart'
    as _i4;

/// generated route for
/// [_i1.CollectionDetailScreen]
class CollectionDetailScreen
    extends _i5.PageRouteInfo<CollectionDetailScreenArgs> {
  CollectionDetailScreen({
    _i6.Key? key,
    required int id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         CollectionDetailScreen.name,
         args: CollectionDetailScreenArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'CollectionDetailScreen';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionDetailScreenArgs>();
      return _i1.CollectionDetailScreen(key: args.key, id: args.id);
    },
  );
}

class CollectionDetailScreenArgs {
  const CollectionDetailScreenArgs({this.key, required this.id});

  final _i6.Key? key;

  final int id;

  @override
  String toString() {
    return 'CollectionDetailScreenArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardScreen extends _i5.PageRouteInfo<void> {
  const DashboardScreen({List<_i5.PageRouteInfo>? children})
    : super(DashboardScreen.name, initialChildren: children);

  static const String name = 'DashboardScreen';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i3.SignInScreen]
class SignInScreen extends _i5.PageRouteInfo<void> {
  const SignInScreen({List<_i5.PageRouteInfo>? children})
    : super(SignInScreen.name, initialChildren: children);

  static const String name = 'SignInScreen';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignInScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen({List<_i5.PageRouteInfo>? children})
    : super(SplashScreen.name, initialChildren: children);

  static const String name = 'SplashScreen';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
