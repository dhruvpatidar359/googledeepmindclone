import 'dart:async';

import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:video_player/video_player.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  List<Widget> list = [
    Text(
      "Gemini can\nreason visually\nacross languages",
      key: ValueKey(1),
      style: TextStyle(color: Colors.white, fontSize: 35),
    ),
    Text("Gemini can\ngenerate code\nbased on\ndifferent inputs\nyou give it.",
        key: ValueKey(2), style: TextStyle(color: Colors.white, fontSize: 35)),
    Text("Gemini can\ngenerate text and\nimages,\ncombined.",
        key: ValueKey(3), style: TextStyle(color: Colors.white, fontSize: 35)),
  ];

  List<Widget> listVideos = [];
  List<VideoPlayerController> listControllers = [];
  List<Widget> mobileWidgets = [];

  int index = 0;

  void moveCarasouelRight() {
    index = (index + 1) % list.length;
    listControllers.elementAt(index).play();
    if (index == 1) {
      videoControllerV4.play();
    }
    timer.cancel();
    timer = Timer(Duration(seconds: 8), () {
      moveCarasouelRight();
    });

    setState(() {});
  }

  void moveCarasouelLeft() {
    index = (list.length + index - 1) % list.length;
    listControllers.elementAt(index).play();
    if (index == 1) {
      videoControllerV4.play();
    }
    timer.cancel();
    timer = Timer(Duration(seconds: 8), () {
      moveCarasouelRight();
    });
    setState(() {});
  }

  late VideoPlayerController videoControllerV1;
  late VideoPlayerController videoControllerV2;
  late VideoPlayerController videoControllerV3;
  late VideoPlayerController videoControllerV4;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState

    listControllers.add(
        videoControllerV1 = VideoPlayerController.asset('assets/videos/pxl.mp4')
          ..initialize().then((_) {
            videoControllerV1.setVolume(0);
            videoControllerV1.setLooping(true);
            videoControllerV1.play();
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          }));
    listControllers.add(videoControllerV2 =
        VideoPlayerController.asset('assets/videos/flocking.mp4')
          ..initialize().then((_) {
            videoControllerV2.setVolume(0);
            videoControllerV2.setLooping(true);
            videoControllerV2.play();
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          }));

    listControllers.add(videoControllerV3 =
        VideoPlayerController.asset('assets/videos/knitting.mp4')
          ..initialize().then((_) {
            videoControllerV3.setVolume(0);
            videoControllerV3.setLooping(true);
            videoControllerV3.play();
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          }));

    listControllers.add(videoControllerV4 =
        VideoPlayerController.asset('assets/videos/flocking-coded.mp4')
          ..initialize().then((_) {
            videoControllerV4.setVolume(0);
            videoControllerV4.setLooping(true);
            videoControllerV4.play();
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          }));

    listVideos.add(
      Stack(key: ValueKey(1), alignment: Alignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: 250,
            height: 250,
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 2,
              child: AspectRatio(
                  aspectRatio: videoControllerV1!.value.aspectRatio,
                  child: VideoPlayer(videoControllerV1)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 65,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xFFbfb9b5),
                  borderRadius: BorderRadius.circular(18)),
              child: Center(
                  child: Text(
                textAlign: TextAlign.center,
                "Could Gemini explain what this means?",
                style: GoogleFonts.manrope(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            )
                .animate()
                .scale(
                    duration: 500.ms,
                    delay: 1000.ms,
                    curve: Curves.easeInOut,
                    begin: Offset(0.6, 0.6),
                    end: Offset(1, 1),
                    alignment: Alignment.center)
                .fade(
                    duration: 500.ms,
                    begin: 0,
                    delay: 1000.ms,
                    end: 1,
                    curve: Curves.easeInOut),
          ),
        )
      ]),
    );

    listVideos.add(
      Stack(key: ValueKey(2), alignment: Alignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: 250,
            height: 250,
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 2,
              child: AspectRatio(
                  aspectRatio: videoControllerV2!.value.aspectRatio,
                  child: VideoPlayer(videoControllerV2)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 65,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xFFadc2d1),
                  borderRadius: BorderRadius.circular(18)),
              child: Center(
                  child: Text(
                textAlign: TextAlign.center,
                "Could Gemini help make a demo based on this video?",
                style: GoogleFonts.manrope(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            )
                .animate()
                .scale(
                    duration: 500.ms,
                    delay: 1000.ms,
                    curve: Curves.easeInOut,
                    begin: Offset(0.6, 0.6),
                    end: Offset(1, 1),
                    alignment: Alignment.center)
                .fade(
                    duration: 500.ms,
                    delay: 1000.ms,
                    begin: 0,
                    end: 1,
                    curve: Curves.easeInOut),
          ),
        )
      ]),
    );

    listVideos.add(
      Stack(
          key: ValueKey(3),
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: 250,
                height: 250,
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 2,
                  child: AspectRatio(
                      aspectRatio: videoControllerV3!.value.aspectRatio,
                      child: VideoPlayer(videoControllerV3)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 65,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Color(0xFFffddb7),
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                      child: Text(
                    textAlign: TextAlign.center,
                    "Could Gemini show me ideas for what to make?",
                    style: GoogleFonts.manrope(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )),
                )
                    .animate()
                    .scale(
                        duration: 500.ms,
                        delay: 1000.ms,
                        curve: Curves.easeInOut,
                        begin: Offset(0.6, 0.6),
                        end: Offset(1, 1),
                        alignment: Alignment.center)
                    .fade(
                        duration: 500.ms,
                        delay: 1000.ms,
                        begin: 0,
                        end: 1,
                        curve: Curves.easeInOut),
              ),
            )
          ]),
    );

    mobileWidgets.add(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "I see the time signature is 6/8. This means there are 6 eighth notes in each measure.\n\nThe dynamic marking is piano, which means to play softly. Andante grazioso means to play at a graceful walking pace.",
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
        )
            .animate()
            .slideY(
                curve: Curves.easeInOut, begin: 1, duration: 1000.ms, end: 0)
            .fadeIn(
              duration: 1000.ms,
              curve: Curves.easeInOut,
            ),
      ),
    );

    mobileWidgets.add(Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "I see a murmuration of starlings, so I coded a flocking simulation.",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
          )
              .animate()
              .slideY(
                  curve: Curves.easeInOut, begin: 1, duration: 1000.ms, end: 0)
              .fadeIn(
                duration: 1000.ms,
                curve: Curves.easeInOut,
              ),
          Gap(10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.hardEdge,
            child: Container(
              width: 230,
              height: 120,
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 2,
                child: AspectRatio(
                    aspectRatio: videoControllerV4!.value.aspectRatio,
                    child: VideoPlayer(videoControllerV4)),
              ),
            ),
          )
              .animate()
              .slideY(
                  curve: Curves.easeInOut, begin: 1, duration: 1000.ms, end: 0)
              .fadeIn(
                duration: 1000.ms,
                curve: Curves.easeInOut,
              ),
          Gap(10),
          Container(
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff232322),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                """class Boid {
      constructor(x, y) {
        this.pos = new p5.Vector(x, y);
        this.vel = p5.Vector.random2D();
        this.vel.setMag(random(2, 4));
        this.acc = new p5.Vector();
        this.maxForce = 0.2;
        this.maxSpeed = 4;
      }
    }
      """,
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 8),
              ),
            ),
          )
              .animate()
              .slideY(
                  curve: Curves.easeInOut, duration: 1000.ms, begin: 1, end: 0)
              .fadeIn(
                duration: 1000.ms,
              ),
        ],
      ),
    ));

    mobileWidgets.add(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(key: ValueKey(1), alignment: Alignment.center, children: [
              Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/pink_and_blue_octopus.jpg"),
                          )))
                  .animate()
                  .scale(
                      duration: 800.ms,
                      curve: Curves.easeInOut,
                      begin: Offset(0.6, 0.6),
                      end: Offset(1, 1),
                      alignment: Alignment.center)
                  .fade(
                      duration: 800.ms,
                      begin: 0,
                      end: 1,
                      curve: Curves.easeInOut),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Color(0xFFe1d3c1),
                        borderRadius: BorderRadius.circular(18)),
                    child: Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      "how about an octopus with blue and pink tentacles?",
                      style: GoogleFonts.manrope(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
                  )
                      .animate()
                      .scale(
                          duration: 800.ms,
                          curve: Curves.easeInOut,
                          begin: Offset(0.6, 0.6),
                          end: Offset(1, 1),
                          alignment: Alignment.center)
                      .fade(
                          duration: 800.ms,
                          begin: 0,
                          end: 1,
                          curve: Curves.easeInOut),
                ),
              )
            ]),
            Gap(10),
            Container(
                    width: 220,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          image: AssetImage(
                              "assets/images/pink_and_blue_mouse.jpg"),
                        )))
                .animate()
                .scale(
                    duration: 800.ms,
                    curve: Curves.easeInOut,
                    begin: Offset(0.6, 0.6),
                    end: Offset(1, 1),
                    alignment: Alignment.center)
                .fade(
                    duration: 800.ms,
                    begin: 0,
                    end: 1,
                    curve: Curves.easeInOut),
          ],
        ),
      ),
    );

    timer = Timer(Duration(seconds: 8), () {
      moveCarasouelRight();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Color(0xff070607),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 50,
              width: 50,
              child: Center(
                child: AnimatedCarasouelMovers(
                  icon: CupertinoIcons.arrow_left,
                  callBack: moveCarasouelLeft,
                ),
              )),
          Gap(20),
          Container(
            height: 250,
            width: 250,
            child: AnimatedSwitcherTranslation.top(
                duration: const Duration(milliseconds: 1500),
                offset: 0.5,
                enableFade: true,
                reverseDuration: const Duration(milliseconds: 800),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: list.elementAt(index)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                height: 250,
                width: 250,
                color: Colors.transparent,
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 2000),
                    reverseDuration: const Duration(milliseconds: 800),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    child: listVideos.elementAt(index)),
              ),
              Gap(20),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  stops: [0.3, 0.6],
                  colors: [Color(0xFFffddb7), Color(0xff4387ea)],
                ).createShader(bounds),
                child: Icon(
                  CupertinoIcons.arrow_right,
                  weight: 20,
                  size: 30,
                ),
              ),
              Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    "Gemini",
                    colors: [Color(0xff4387ea), Color(0xff71a3ec)],
                    style: GoogleFonts.manrope(),
                  ),
                  Gap(5),
                  Container(
                    height: 400,
                    width: 270,
                    color: Colors.transparent,
                    child: Center(
                      child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 4000),
                                  reverseDuration:
                                      const Duration(milliseconds: 4000),
                                  switchInCurve: Curves.easeInOut,
                                  switchOutCurve: Curves.easeInOut,
                                  child: mobileWidgets.elementAt(index)),
                            ),
                            Container(
                              width: 270,
                              height: 400,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    stops: [
                                      0.01,
                                      0.5,
                                      0.9,
                                    ],
                                    colors: [
                                      Color(0xFFffddb7),
                                      Color(0xff4387ea),
                                      Color(0xff4387ea)
                                    ],
                                  ),
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            Positioned(
                              bottom: -60,
                              child: Container(
                                height: 280,
                                width: 280,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Colors.transparent,
                                      Color(0xff070607),
                                      Color(0xff070607)
                                    ])),
                              ),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
          Gap(10),
          Container(
              height: 50,
              width: 50,
              child: Center(
                child: AnimatedCarasouelMovers(
                  icon: CupertinoIcons.arrow_right,
                  callBack: moveCarasouelRight,
                ),
              )),
        ],
      ),
    );
  }
}

class AnimatedCarasouelMovers extends StatefulWidget {
  AnimatedCarasouelMovers(
      {super.key, required this.icon, required this.callBack});

  IconData icon;
  late VoidCallback callBack;

  @override
  State<AnimatedCarasouelMovers> createState() =>
      _AnimatedCarasouelMoversState();
}

class _AnimatedCarasouelMoversState extends State<AnimatedCarasouelMovers> {
  bool isHover = false;
  void onHover(value) {
    if (value) {
      isHover = true;
    } else {
      isHover = false;
    }
    setState(() {});
    // print(isHover);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: widget.callBack,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: CircleAvatar(
          backgroundColor: Color(0xff383939),
          radius: isHover ? 23 : 20,
          child: Icon(
            widget.icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
