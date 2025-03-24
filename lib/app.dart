import 'package:flutter/material.dart';
import 'package:pixelfield/app_routes/app_routes.dart';
import 'package:pixelfield/theme/palette.dart';

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'One Cask at a Time',
      routerConfig: router.config(),
      theme: ThemeData(scaffoldBackgroundColor: Palette.darkGreen19),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: GlobalScrollBehavior(),
          child: child!,
        );
      },
    );
  }
}
