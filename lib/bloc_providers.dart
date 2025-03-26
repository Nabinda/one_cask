import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/collection_screen/bloc/video_controller/video_controller_bloc.dart';
import 'package:provider/single_child_widget.dart';

import 'features/dashboard_screen/bloc/bottom_nav/bottom_nav_bloc.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => BottomNavBloc()),
  BlocProvider(create: (context) => VideoControllerBloc()),
];
