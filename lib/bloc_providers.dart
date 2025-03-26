import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/collection_screen/bloc/collection_detail/collection_detail_bloc.dart';
import 'package:pixelfield/features/collection_screen/bloc/collection_listing/collection_listing_bloc.dart';
import 'package:pixelfield/features/collection_screen/bloc/video_controller/video_controller_bloc.dart';
import 'package:pixelfield/features/collection_screen/data/repo/collection_repo.dart';
import 'package:provider/single_child_widget.dart';

import 'features/dashboard_screen/bloc/bottom_nav/bottom_nav_bloc.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => BottomNavBloc()),
  BlocProvider(create: (context) => VideoControllerBloc()),
  BlocProvider(create: (context) => CollectionListingBloc(CollectionRepo())),
  BlocProvider(create: (context) => CollectionDetailBloc(CollectionRepo())),
];
