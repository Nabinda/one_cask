import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/constants/app_icon_constants.dart';
import 'package:pixelfield/core/responsive_helper.dart';
import 'package:pixelfield/features/collection_screen/view/collection_screen.dart';
import 'package:pixelfield/features/components/widgets/app_icon.dart';
import 'package:pixelfield/features/components/widgets/unavailable_widget.dart';
import 'package:pixelfield/features/dashboard_screen/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixelfield/features/dashboard_screen/model/bottom_nav_model.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  BottomNavigationBarItem _bottomBarItem(BottomNavModel item, bool isSelected) {
    return BottomNavigationBarItem(
      backgroundColor: Palette.darkGreen19,
      label: item.label,
      tooltip: item.tooltip,
      icon: AppIcon(
        icon: item.icon,
        size: 24,
        color: isSelected ? Palette.white : Palette.grey94,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    updateIndex(int index) {
      context.read<BottomNavBloc>().add(UpdateIndex(index));
    }

    List<BottomNavModel> items = [
      BottomNavModel(
          label: 'Scan', icon: AppIconConstants.scan, tooltip: 'Scan'),
      BottomNavModel(
          label: 'Collection',
          icon: AppIconConstants.collection,
          tooltip: 'My Collection'),
      BottomNavModel(
          label: 'Shop', icon: AppIconConstants.shop, tooltip: 'My Shop'),
      BottomNavModel(
          label: 'Settings',
          icon: AppIconConstants.settings,
          tooltip: 'App Settings'),
    ];

    List<Widget> bodyItems = [
      UnavailableWidget(),
      CollectionScreen(),
      UnavailableWidget(),
      UnavailableWidget(),
    ];

    return BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
      int currentIndex = state.currentIndex;
      return Scaffold(
        backgroundColor: Palette.darkGreen21,
        appBar: PreferredSize(
            preferredSize: Size(context.widthPx, 70.h + kToolbarHeight),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16).r,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      items[currentIndex].tooltip,
                      style: AppTextStyle.headlineLarge
                          .copyWith(color: Palette.greyEA)
                          .garamondFont,
                    )),
                    AppIcon(icon: AppIconConstants.notification, size: 40)
                  ],
                ),
              ),
            )),
        body: bodyItems[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: updateIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Palette.grey94,
            elevation: 2,
            selectedIconTheme: IconThemeData(color: Colors.white),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: AppTextStyle.bodySmall.latoFont,
            unselectedLabelStyle: AppTextStyle.bodySmall.latoFont,
            backgroundColor: Palette.darkGreen19,
            currentIndex: currentIndex,
            items: List.generate(
              items.length,
              (index) => _bottomBarItem(items[index], index == currentIndex),
            )),
      );
    });
  }
}
