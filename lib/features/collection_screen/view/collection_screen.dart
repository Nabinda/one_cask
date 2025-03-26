import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/features/collection_screen/bloc/collection_listing/collection_listing_bloc.dart';
import 'package:pixelfield/features/collection_screen/view/widgets/collection_card.dart';
import 'package:pixelfield/features/components/widgets/loading_helper.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentState = context.read<CollectionListingBloc>().state;
      // Only fetch data if it hasn't already been loaded
      if (currentState is! CollectionLoaded) {
        context.read<CollectionListingBloc>().add(FetchCollectionList());
      }
    });

    return BlocBuilder<CollectionListingBloc, CollectionListingState>(
        builder: (context, state) {
      if (state is CollectionError) {
        return Center(
          child: Text(
            state.message,
            style: AppTextStyle.bodyMediumBold.copyWith(color: Palette.greyEA),
          ),
        );
      }
      if (state is CollectionLoaded) {
        return GridView.builder(
            itemCount: state.collections.length,
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.sp,
                mainAxisSpacing: 8.sp,
                childAspectRatio: 0.55),
            itemBuilder: (context, index) =>
                CollectionCard(item: state.collections[index]));
      }
      return GridView.builder(
          itemCount: 10,
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.sp,
              mainAxisSpacing: 8.sp,
              childAspectRatio: 0.55),
          itemBuilder: (context, index) => LoadingShimmerHelper());
    });
  }
}
