import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/constants/app_icon_constants.dart';
import 'package:pixelfield/features/components/widgets/app_icon.dart';
import 'package:pixelfield/features/dashboard_screen/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  BottomNavigationBarItem _bottomBarItem(String label, String icon,
      {bool isSelected = false}) {
    return BottomNavigationBarItem(
      backgroundColor: Palette.darkGreen19,
      label: label,
      icon: AppIcon(
        icon: icon,
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

    return BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
      int currentIndex = state.currentIndex;
      return Scaffold(
        backgroundColor: Palette.darkGreen21,
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
            items: [
              _bottomBarItem('Scan', AppIconConstants.scan,
                  isSelected: currentIndex == 0),
              _bottomBarItem('Collection', AppIconConstants.collection,
                  isSelected: currentIndex == 1),
              _bottomBarItem('Shop', AppIconConstants.shop,
                  isSelected: currentIndex == 2),
              _bottomBarItem('Settings', AppIconConstants.settings,
                  isSelected: currentIndex == 3),
            ]),
      );
    });
  }
}
