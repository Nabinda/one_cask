import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/app_routes/app_routes.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _handleNavigation() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        context.router.replaceAll([SignInScreen()]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/logo/logo.png',
              height: 140.h,
            ),
          ),
        ),
      ),
    );
  }
}
