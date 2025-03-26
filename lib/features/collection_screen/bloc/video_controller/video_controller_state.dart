part of 'video_controller_bloc.dart';

abstract class VideoControllerState {}

class VideoInitial extends VideoControllerState {}

class VideoLoaded extends VideoControllerState {
  final VideoPlayerController videoController;
  final ChewieController chewieController;
  VideoLoaded(this.videoController, this.chewieController);
}

class VideoError extends VideoControllerState {
  final String errorMessage;
  VideoError(this.errorMessage);
}

class DisposeVideoState extends VideoControllerState {}
