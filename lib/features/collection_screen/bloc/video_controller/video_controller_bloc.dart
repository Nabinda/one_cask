import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'video_controller_event.dart';
part 'video_controller_state.dart';

class VideoControllerBloc
    extends Bloc<VideoControllerEvent, VideoControllerState> {
  VideoControllerBloc() : super(VideoInitial()) {
    on<InitializeVideo>(_onInitializeVideo);
    on<PlayVideo>(_onPlayVideo);
    on<PauseVideo>(_onPauseVideo);
    on<DisposeVideo>(_onDisposeVideo);
  }

  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  Future<void> _onInitializeVideo(
      InitializeVideo event, Emitter<VideoControllerState> emit) async {
    try {
      _videoController = VideoPlayerController.asset(event.url);
      await _videoController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: true,
        looping: true,
        showOptions: true,
        showControls: true,
        allowMuting: true,
      );
      emit(VideoLoaded(_videoController, _chewieController!));
    } catch (e) {
      emit(VideoError(e.toString()));
    }
  }

  void _onPlayVideo(PlayVideo event, Emitter<VideoControllerState> emit) {
    if (state is VideoLoaded) {
      _videoController.play();
    }
  }

  void _onPauseVideo(PauseVideo event, Emitter<VideoControllerState> emit) {
    if (state is VideoLoaded) {
      _videoController.pause();
    }
  }

  void _onDisposeVideo(DisposeVideo event, Emitter<VideoControllerState> emit) {
    _chewieController?.dispose();
    _videoController.dispose();
    emit(DisposeVideoState());
  }

  @override
  Future<void> close() {
    _chewieController?.dispose();
    _videoController.dispose();
    return super.close();
  }
}
