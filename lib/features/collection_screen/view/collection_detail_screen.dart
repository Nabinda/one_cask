import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/constants/app_icon_constants.dart';
import 'package:pixelfield/features/collection_screen/bloc/collection_detail/collection_detail_bloc.dart';
import 'package:pixelfield/features/collection_screen/bloc/video_controller/video_controller_bloc.dart';
import 'package:pixelfield/features/collection_screen/view/widgets/details_tab.dart';
import 'package:pixelfield/features/collection_screen/view/widgets/history_tab.dart';
import 'package:pixelfield/features/collection_screen/view/widgets/testing_notes_tab.dart';
import 'package:pixelfield/features/components/buttons/custom_filled_button.dart';
import 'package:pixelfield/features/components/widgets/app_icon.dart';
import 'package:pixelfield/features/components/widgets/image_builder.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class CollectionDetailScreen extends StatefulWidget {
  final int id;
  const CollectionDetailScreen({super.key, required this.id});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCon;
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  late List<Widget> _tabView;

  late int _currentTabIndex;

  @override
  void initState() {
    super.initState();
    _tabCon = TabController(length: 3, vsync: this);
    _currentTabIndex = 0;
    _tabView = [DetailsTab(), TestingNotesTab(), HistoryTab()];
    context.read<CollectionDetailBloc>().add(FetchCollection(widget.id));
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/bg.png',
              ),
            ),
          ),
          child: BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
              builder: (context, state) {
            if (state is CollectionLoaded) {
              // Load video once video url is obtained
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final videoState = context.read<VideoControllerBloc>().state;
                if (videoState is VideoInitial) {
                  context
                      .read<VideoControllerBloc>()
                      .add(InitializeVideo('assets/video/dummy.mp4'));
                }
              });

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8)
                                .r,
                            color: Palette.darkGreen19,
                            child: Text(
                              'Genesis Collection',
                              style: AppTextStyle.bodySmall
                                  .copyWith(color: Palette.greyEA)
                                  .latoFont,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8).r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Palette.darkGreen19,
                              ),
                              child: AppIcon(
                                  icon: AppIconConstants.close, size: 24),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16).r,
                      padding: EdgeInsets.all(8).r,
                      color: Palette.darkGreen19,
                      child: Row(
                        children: [
                          AppIcon(
                            icon: AppIconConstants.genuine,
                            size: 24,
                          ),
                          Gap(8.w),
                          Expanded(
                            child: Text(
                              'Genuine Bottle (Unopened)',
                              style: AppTextStyle.bodyMediumBold
                                  .copyWith(color: Palette.greyEA)
                                  .latoFont,
                            ),
                          ),
                          Gap(8.w),
                          AppIcon(
                            icon: AppIconConstants.arrowDown,
                            size: 24,
                          )
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 34).r,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ImageBuilder(
                          imageUrl: state.collections.imageUrl ?? '',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16).r,
                      child: Container(
                        padding: const EdgeInsets.all(16).r,
                        color: Palette.darkGreen29,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Bottle ${state.collections.bottleNumber}',
                              style: AppTextStyle.bodySmall
                                  .copyWith(color: Palette.greyBF)
                                  .latoFont,
                            ),
                            Gap(8.h),
                            RichText(
                                text: TextSpan(
                                    text: '${state.collections.name} ',
                                    style: AppTextStyle.headlineLarge
                                        .copyWith(color: Palette.greyEA)
                                        .garamondFont,
                                    children: [
                                  TextSpan(
                                      text:
                                          '${state.collections.age} Year old ',
                                      style: AppTextStyle.headlineLarge
                                          .copyWith(color: Palette.orange00)
                                          .garamondFont),
                                  TextSpan(text: '#${state.collections.code}'),
                                ])),
                            Gap(24.h),
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                  color: Palette.darkGreen21,
                                  borderRadius: BorderRadius.circular(8)),
                              child: TabBar(
                                  controller: _tabCon,
                                  labelColor: Palette.title19,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorPadding: EdgeInsets.all(2),
                                  labelPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  dividerHeight: 0,
                                  padding: EdgeInsets.zero,
                                  labelStyle: AppTextStyle.bodySmall.latoFont,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Palette.orange00),
                                  onTap: (value) {
                                    setState(() {
                                      _currentTabIndex = value;
                                    });
                                  },
                                  tabs: [
                                    Tab(
                                      text: 'Details',
                                    ),
                                    Tab(
                                      text: 'Testing Notes',
                                    ),
                                    Tab(
                                      text: 'History',
                                    )
                                  ]),
                            ),
                            Gap(24.h),
                            _tabView[_currentTabIndex]
                          ],
                        ),
                      ),
                    ),
                    Gap(40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomFilledButton(
                          onTap: () {},
                          padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16)
                              .r,
                          label: 'Add to my Collection',
                          icon: AppIconConstants.plus,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            if (state is CollectionError) {
              return Center(
                  child: Text(
                state.message,
                style:
                    AppTextStyle.bodyMediumBold.copyWith(color: Palette.greyEA),
              ));
            }
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }),
        ),
      ),
    );
  }
}
