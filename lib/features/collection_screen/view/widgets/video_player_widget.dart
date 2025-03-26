import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/collection_screen/bloc/video_controller/video_controller_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoControllerBloc, VideoControllerState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          return VisibilityDetector(
            key: ObjectKey(state.videoController),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction == 0) {
                context.read<VideoControllerBloc>().add(PauseVideo());
              } else if (visibility.visibleFraction == 1) {
                context.read<VideoControllerBloc>().add(PlayVideo());
              }
            },
            child: AspectRatio(
              aspectRatio: state.videoController.value.aspectRatio,
              child: Chewie(controller: state.chewieController),
            ),
          );
        } else if (state is VideoError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}
