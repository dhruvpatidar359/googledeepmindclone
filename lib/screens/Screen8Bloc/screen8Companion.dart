import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googledeepmind/screens/Screen8Bloc/screen8Bloc.dart';
import 'package:pod_player/pod_player.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../scrollBloc/scroll_bar_offset_bloc.dart';

class Screen8VideoPlayer extends StatefulWidget {
  const Screen8VideoPlayer({super.key});

  @override
  State<Screen8VideoPlayer> createState() => _Screen8VideoPlayerState();
}

class _Screen8VideoPlayerState extends State<Screen8VideoPlayer> {
  double size = 100;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/staticV1.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.setLooping(true);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
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
      child: BlocConsumer<Screen8Bloc, Screen8State>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is StaticPlayerState) {
            return BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
              listener: (context, state) {
                if (state is ScrollBarOffsetValue) {
                  if (state.offset > 4100) {
                    size = state.offset - 3800;
                  } else {}
                }
              },
              buildWhen: (previous, current) {
                if (current is ScrollBarOffsetValue) {
                  if (current.offset > 4100 && current.offset < 5000) {
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
                      context
                          .read<Screen8Bloc>()
                          .add(YoutubePlayerEvent(seekPosition: 0));
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
            );
          } else if (state is YoutubePlayerState) {
            final videoPlayerController = VideoPlayerController.networkUrl(
                Uri.parse(
                    'https://firebasestorage.googleapis.com/v0/b/eventzz-25548.appspot.com/o/Hands-on%20with%20Gemini_%20Interacting%20with%20multimodal%20AI_2.mp4?alt=media&token=964a9abe-5caa-4245-bb2e-605491d58450'))
              ..initialize();

            final chewieController = ChewieController(
                videoPlayerController: videoPlayerController,
                autoPlay: true,
                autoInitialize: true,
                placeholder: Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 10,
                )),
                startAt: Duration(seconds: state.seekPosition),
                looping: true,
                allowFullScreen: false);

            final playerWidget = Chewie(
              controller: chewieController,
            );

            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: AspectRatio(aspectRatio: 16 / 9, child: playerWidget),
              ),
            );
          } else {
            return Container(
              color: Colors.white,
            );
          }
        },
      ),
    );
  }
}
