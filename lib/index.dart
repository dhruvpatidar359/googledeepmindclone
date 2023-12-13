import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/animatedBox/animatedBoxPage.dart';
import 'package:gap/gap.dart';
import 'package:googledeepmind/screens/Screen2.dart';
import 'package:googledeepmind/screens/screen1.dart';
import 'package:googledeepmind/screens/screen3.dart';
import 'package:googledeepmind/screens/screen4.dart';
import 'package:googledeepmind/screens/screen5.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late ScrollController scrollController;
  // late ScrollController scrollController2;
  late AnimationController animationController;
  late AnimationController topBarAnimationController;

  bool visible = true;
  Color shadowColor = Color(0xff5f6269);
  double target = 1.0;

  @override
  void initState() {
    scrollController = ScrollController();

    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
        reverseDuration: Duration(milliseconds: 200));

    topBarAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        reverseDuration: Duration(milliseconds: 300));

    // topBarAnimationController.addListener(() {
    //   print(topBarAnimationController.value);
    //   // print("we are animating ");
    // });
    topBarAnimationController.forward();
    scrollController.addListener(() {
      // if (scrollController.position.pixels > 375) {
      //   visible = false;
      //   target = 0.0;
      // } else {
      //   visible = true;
      //   target = 1.0;
      // }
      // setState(() {});
      if (scrollController.position.pixels < 30) {
        topBarAnimationController.forward();
      } else {
        if (scrollController.position.userScrollDirection ==
                ScrollDirection.reverse &&
            !topBarAnimationController.isAnimating) {
          topBarAnimationController.reverse();
          // print("reversing the direction");
        } else if (scrollController.position.userScrollDirection ==
                ScrollDirection.forward &&
            !topBarAnimationController.isAnimating) {
          topBarAnimationController.forward();
        }
      }

      context.read<ScrollBarOffsetBloc>().add(
          ScrollBarOffsetValueEvent(scrollController.position.pixels.toInt()));
      // print("pixes ${scrollController.position.pixels}");
    });

    super.initState();
  }

  void onHover(value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  // color: Colors.transparent,
                  gradient: RadialGradient(
                      center: Alignment.topCenter,
                      // focal: Alignment.center,
                      radius: 1,
                      focalRadius: 0.2,
                      colors: [Color(0xff303342), Color(0xff070607)])),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    // Screen1(),
                    // Screen2(),
                    // Screen3(),
                    // Screen4(),
                    // Container(
                    //     color: Color(0xff070607),
                    //     height: 600,
                    //     width: MediaQuery.sizeOf(context).width,
                    //     child: Center(
                    //       child: AnimatedButton(
                    //         string: "Read the technical report",
                    //       ),
                    //     )),
                    // AnimatedBoxPage()
                    Screen5()
                  ],
                ),
              )),
          BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is ScrollBarOffsetValue) {
                if (state.offset > 317) {
                  visible = false;
                } else {
                  visible = true;
                }
              }
            },
            builder: (context, state) {
              return Visibility(
                  maintainAnimation: false,
                  visible: !visible,
                  child: Align(
                      alignment: Alignment(0, -0.7),
                      child: FloatingNavBarScreen1()));
            },
          ),
          AnimatedBuilder(
            animation: topBarAnimationController,
            builder: (context, child) => Positioned(
              top: -100 + topBarAnimationController.value * 100,
              child: BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
                listener: (context, state) {
                  if (state is ScrollBarOffsetValue) {
                    if (state.offset < 30) {
                      animationController.reverse();
                    } else if (state.offset > 30) {
                      animationController.forward();
                    }
                  }
                },
                buildWhen: (previous, current) {
                  if (animationController.isAnimating) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  return AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) => MouseRegion(
                      onEnter: (event) {
                        if (scrollController.position.pixels < 30) {
                          animationController.forward();
                        }
                      },
                      onExit: (event) {
                        if (scrollController.position.pixels < 30) {
                          animationController.reverse();
                        }
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.sizeOf(context).width,
                        color: ColorTween(
                                begin: Colors.transparent,
                                end: Color(0xff070607))
                            .evaluate(animationController),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Gap(20),
                            HoverTextStatic(),
                            Gap(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HoverText(string: "About"),
                                Gap(20),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Technologies",
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 2,
                                        width: 105,
                                        color: Color(0xff1a73e8),
                                      ),
                                    )
                                  ],
                                ),
                                Gap(20),
                                HoverText(string: "Impact"),
                                Gap(20),
                                HoverText(string: "Discover"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width /
                                          1.9,
                                    ),
                                    HoverIcon()
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}

class HoverTextStatic extends StatefulWidget {
  HoverTextStatic();

  @override
  State<HoverTextStatic> createState() => _HoverTextStaticState();
}

class _HoverTextStaticState extends State<HoverTextStatic> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        isHovering = value;
        setState(() {});
      },
      onTap: () {},
      child: Row(
        children: [
          Text(
            "Google",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              color: isHovering == false ? Color(0xff5f6269) : Colors.white,
              fontSize: 22,
            ),
          ),
          Text(
            " DeepMind",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500,
              color: isHovering == false ? Color(0xff5f6269) : Colors.white,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  HoverText({required this.string});
  final String string;
  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        reverseDuration: const Duration(milliseconds: 200));
    super.initState();
  }

  void onHover(value) {
    if (value == true) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: () {},
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return Text(
            widget.string,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              color: ColorTween(begin: Color(0xff5f6269), end: Colors.white)
                  .evaluate(animationController),
              fontSize: 16,
            ),
          );
        },
      ),
    );
  }
}

class HoverIcon extends StatefulWidget {
  HoverIcon();

  @override
  State<HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        reverseDuration: const Duration(milliseconds: 200));
    super.initState();
  }

  void onHover(value) {
    if (value == true) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: () {},
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return Icon(
            Icons.search,
            color: ColorTween(begin: Color(0xff5f6269), end: Colors.white)
                .evaluate(animationController),
          );
        },
      ),
    );
  }
}
