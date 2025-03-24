part of 'bottom_nav_bloc.dart';

class BottomNavState {
  final int currentIndex;

  BottomNavState({this.currentIndex = 0});

// Changing Index
  BottomNavState changeIndex(int index) {
    return BottomNavState(currentIndex: index);
  }
}
