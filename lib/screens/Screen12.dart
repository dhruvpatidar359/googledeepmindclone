import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

List<List<String>> data = [
  ["/images/snackable-01.png", "NHLnjWTEZps"],
  ["/images/snackable-02.png", "Rn30RMhEBTs"],
  ["/images/snackable-03.png", "ki8kRJPXCW0"],
  ["/images/snackable-05.png", "HP2pNdCRT5M"],
  ["/images/snackable-06.png", "aRyuMNwn02w"],
  ["/images/snackable-08.png", "JPwU1FNhMOA"],
];

class Screen12 extends StatefulWidget {
  const Screen12({super.key});

  @override
  State<Screen12> createState() => _Screen12State();
}

class _Screen12State extends State<Screen12> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height / 1.35,
        width: MediaQuery.sizeOf(context).width,
        color: Color(0xff070607),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3,
                    (index) => TrainerBoxesTwo(
                          image: data.elementAt(index).elementAt(0),
                          youtubeVideoId: data.elementAt(index).elementAt(1),
                        ))),
          ],
        ));
  }
}

class Screen12Companion extends StatefulWidget {
  const Screen12Companion({super.key});

  @override
  State<Screen12Companion> createState() => Screen12CompanionState();
}

class Screen12CompanionState extends State<Screen12Companion> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height / 1.35,
        width: MediaQuery.sizeOf(context).width,
        color: Color(0xff070607),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3,
                    (index) => TrainerBoxesTwo(
                          image: data.elementAt(index + 3).elementAt(0),
                          youtubeVideoId:
                              data.elementAt(index + 3).elementAt(1),
                        ))),
          ],
        ));
  }
}

class Screen12Text extends StatefulWidget {
  const Screen12Text({super.key});

  @override
  State<Screen12Text> createState() => _Screen12TextState();
}

class _Screen12TextState extends State<Screen12Text> {
  double target = 0.0;
  bool flag = false;
  double start = 0;
  double end = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 6,
      width: MediaQuery.sizeOf(context).width,
      color: Color(0xff070607),
      child: BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ScrollBarOffsetValue) {
            if (state.offset > 9169 && state.offset < 9900 && flag == false) {
              target = 1.0;
            } else if (state.offset < 9900 &&
                flag == true &&
                state.offset > 9169) {
              target = 0.0;
            } else if (state.offset > 9900) {
              target = 1.0;
              flag = true;
              start = 1.0;
              end = 0.0;
            } else if (state.offset < 9900) {
              target = 0.0;
              start = 0.0;
              end = 1.0;
              flag = false;
            }
            // if (state.offset < 1700) {
            //
            // }
          }
        },
        buildWhen: (previous, current) {
          if (current is ScrollBarOffsetValue) {
            if (current.offset > 9100 && current.offset < 10000) {
              return true;
            }
          }
          return false;
        },
        builder: (context, state) {
          return Column(
            children: [
              Text("See more of what #GeminiAI",
                  style: GoogleFonts.manrope(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              Text("can do",
                  style: GoogleFonts.manrope(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
            ],
          ).animate(target: target, effects: [
            SlideEffect(
              begin: Offset(0, 0),
              end: Offset(0, -0.2),
              duration: 600.ms,
              curve: Curves.easeInOut,
            ),
            FadeEffect(
              begin: start,
              end: end,
              duration: 600.ms,
              curve: Curves.easeInOut,
            )
          ]);
        },
      ),
    );
  }
}

class TrainerBoxesTwo extends StatefulWidget {
  TrainerBoxesTwo({required this.image, required this.youtubeVideoId});

  final image;

  final youtubeVideoId;

  @override
  State<TrainerBoxesTwo> createState() => _TrainerBoxesTwoState();
}

class _TrainerBoxesTwoState extends State<TrainerBoxesTwo>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;
  late AnimationController _gradeintController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );

    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    _gradeintController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    )..repeat();

    _gradeintController.addListener(() => setState(() {}));
    _gradeintController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _gradeintController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _gradeintController.forward();
      }
    });
    _gradeintController.forward();

    super.initState();
  }

  bool crossHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curvedAnimation,
      builder: (context, child) {
        return Container(
          child: Container(
            height: 400,
            width: 400,
            child: Center(
              child: Transform.scale(
                scale: 1 + curvedAnimation.value * 0.1,
                child: InkWell(
                  onHover: (value) {
                    if (value)
                      animationController.forward();
                    else {
                      animationController.reverse();
                    }
                  },
                  onTap: () async {
                    double target = 1.0;
                    final _ytController = YoutubePlayerController(
                      params: YoutubePlayerParams(
                        mute: false,
                        showControls: true,
                        showFullscreenButton: true,
                      ),
                    );

                    _ytController.loadVideoById(videoId: widget.youtubeVideoId);

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
                                    width:
                                        MediaQuery.sizeOf(context).width / 1.3,
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
                  child: Container(
                    height: 360,
                    width: 360,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            transform: GradientRotation(
                              _gradeintController.value * (2 * pi),
                            ),
                            colors: [
                              ColorTween(
                                      begin: Colors.transparent,
                                      end: Color(0xff4387ea))
                                  .evaluate(curvedAnimation)!,
                              ColorTween(
                                begin: Colors.transparent,
                                end: Color(0xFFffddb7),
                              ).evaluate(curvedAnimation)!
                            ],
                          ),
                          width: 12,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Stack(alignment: Alignment.center, children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Transform.scale(
                                scale: 1 + curvedAnimation.value * 0.1,
                                child: Image(
                                  image: AssetImage(
                                    widget.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 35 + 10 * curvedAnimation.value,
                              child: Icon(
                                Icons.play_arrow,
                                color: Color(0xff070607),
                                size: 50,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
