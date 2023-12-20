import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  double size = 100;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/GeminiGoogleDeepMind.mp4')
          ..initialize().then((_) {
            _controller.setVolume(0);
            _controller.setLooping(true);
            _controller.play();
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  bool isHovering = false;
  bool crossHover = false;

  void onHover(value) {
    if (value) {
      isHovering = true;
    } else {
      isHovering = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Color(0xff070607),
      child: BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ScrollBarOffsetValue) {
            if (state.offset > 1000) {
              size = state.offset - 500;

              // _controller.play();
            } else {
              // _controller.pause();
            }
          }
        },
        buildWhen: (previous, current) {
          if (current is ScrollBarOffsetValue) {
            if (current.offset > 965 && current.offset < 1500) {
              return true;
            }
          }
          return false;
        },
        builder: (context, state) {
          return Stack(alignment: Alignment.center, children: [
            Container(
              height: size,
              width: size,
              constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: MediaQuery.sizeOf(context).width / 1.3,
                  maxHeight: MediaQuery.sizeOf(context).height / 1.1,
                  minHeight: 100),
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FittedBox(
                  fit: BoxFit.cover, // Set the desired fit
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                double target = 1.0;
                final _ytController = YoutubePlayerController(
                  params: YoutubePlayerParams(
                    mute: false,
                    showControls: true,
                    showFullscreenButton: true,
                  ),
                );

                _ytController.loadVideoById(videoId: "jV1vkHv4zq8");

                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) => BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Dialog(
                          backgroundColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(20),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff1d1c1c),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      color: Colors.transparent,
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: YoutubePlayer(
                                          controller: _ytController,
                                          aspectRatio: 16 / 9,
                                          // You can also use this property to handle video playback errors

                                          // Add more configurations and callbacks as needed
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(20),
                              InkWell(
                                onHover: (value) {
                                  if (value) {
                                    crossHover = true;
                                  } else {
                                    crossHover = false;
                                  }
                                  setState(() {});
                                },
                                onTap: () {
                                  Navigator.pop(context);
                                  target = 0.0;

                                  // setState(() {});
                                  // await _ytController.playVideo();
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff807a74),
                                      child: Icon(Icons.close),
                                      radius: crossHover ? 25 : 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                            .animate(target: target)
                            .fadeIn(begin: 0, duration: 800.ms)
                            .slideY(begin: 0.2, end: 0.0, duration: 800.ms),
                      ),
                    );
                  },
                );
              },
              onHover: onHover,
              child: Container(
                height: size,
                width: size,
                constraints: BoxConstraints(
                    minWidth: 100,
                    maxWidth: MediaQuery.sizeOf(context).width / 1.3,
                    maxHeight: MediaQuery.sizeOf(context).height / 1.1,
                    minHeight: 100),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: isHovering ? 40 : 35,
                    child: Icon(
                      Icons.play_arrow,
                      color: Color(0xff070607),
                      size: 50,
                    ),
                  ),
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
