import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/features/collection_screen/view/widgets/collection_card.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.sp,
            mainAxisSpacing: 8.sp,
            childAspectRatio: 0.55),
        itemBuilder: (context, index) => CollectionCard());
  }
}
