part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent {}

class UpdateIndex extends BottomNavEvent {
  final int index;
  UpdateIndex(this.index);
}

class ResetIndex extends BottomNavEvent {}
