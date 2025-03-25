import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnavailableWidget extends StatelessWidget {
  const UnavailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/not-found.json'),
    );
  }
}
