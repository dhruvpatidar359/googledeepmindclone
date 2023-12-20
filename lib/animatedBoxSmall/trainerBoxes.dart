import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrainerBoxes extends StatefulWidget {
  TrainerBoxes(
      {required this.image,
      required this.name,
      required this.explain,
      required this.youtubeVideoId});

  final image;
  final name;
  final explain;
  final youtubeVideoId;

  @override
  State<TrainerBoxes> createState() => _TrainerBoxesState();
}

class _TrainerBoxesState extends State<TrainerBoxes>
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
          width: 430,
          // color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
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
                                  width: MediaQuery.sizeOf(context).width / 1.3,
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
                  height: 380,
                  width: 450,
                  child: Center(
                    child: Transform.scale(
                      scale: 1 + curvedAnimation.value * 0.1,
                      child: Container(
                        height: 340,
                        width: 340,
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
                              child:
                                  Stack(alignment: Alignment.center, children: [
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
              Row(
                children: [
                  Gap(55),
                  Flexible(
                    child: Text(
                      widget.name,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.manrope(
                          fontSize: 18,
                          color: Color(0xff989fa4),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Gap(55),
                  Flexible(
                    child: Text(
                      widget.explain,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.manrope(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
