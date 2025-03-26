part of 'video_controller_bloc.dart';

abstract class VideoControllerEvent {}

class InitializeVideo extends VideoControllerEvent {
  final String url;
  InitializeVideo(this.url);
}

class PlayVideo extends VideoControllerEvent {}

class PauseVideo extends VideoControllerEvent {}

class DisposeVideo extends VideoControllerEvent {}
