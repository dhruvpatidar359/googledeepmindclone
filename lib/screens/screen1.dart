import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

class Screen1 extends StatefulWidget {
  Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double target = 1.0;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            // color: Colors.transparent,
            gradient: RadialGradient(
                center: Alignment.topCenter,
                // focal: Alignment.center,

                radius: 1,
                focalRadius: 0.2,
                colors: [Color(0xff2e3342), Color(0xff070607)])),
        child: BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
          listener: (context, state) {
            // TODO: implement listener

            if (state is ScrollBarOffsetValue) {
              if (state.offset > 317) {
                visible = false;
                target = 0.5;
              } else {
                visible = true;
                target = 1.0;
              }
            }
          },
          buildWhen: (previous, current) {
            if (current is ScrollBarOffsetValue) {
              if (current.offset < 508) {
                return true;
              }
            }
            return false;
          },
          builder: (context, state) {
            // print("buildthis ");
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(100),
                Animate(
                  target: target,
                  effects: [
                    SlideEffect(
                        begin: Offset(0, 1),
                        end: Offset(0, 0),
                        delay: 400.ms,
                        curve: Curves.easeInOut,
                        duration: 600.ms),
                    FadeEffect(
                      begin: 0,
                      end: 1,
                      delay: 400.ms,
                      duration: 600.ms,
                      curve: Curves.easeInOut,
                    )
                  ],
                  child: Text(
                    "Welcome to",
                    style: GoogleFonts.manrope(
                        fontSize: 140,
                        color: Colors.white,
                        height: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Animate(
                      target: target,
                      effects: [
                        SlideEffect(
                            begin: Offset(0, 1),
                            end: Offset(0, 0),
                            delay: 420.ms,
                            curve: Curves.easeInOut,
                            duration: 600.ms),
                        FadeEffect(
                          begin: 0,
                          end: 1,
                          delay: 420.ms,
                          duration: 600.ms,
                          curve: Curves.easeInOut,
                        )
                      ],
                      child: Text(
                        "the",
                        style: GoogleFonts.manrope(
                            fontSize: 140,
                            color: Colors.white,
                            height: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Gap(20),
                    // Tranform Text
                    Animate(
                      target: target,
                      effects: [
                        SlideEffect(
                            begin: Offset(0, 1),
                            end: Offset(0, 0),
                            delay: 440.ms,
                            curve: Curves.easeInOut,
                            duration: 600.ms),
                        FadeEffect(
                          begin: 0,
                          end: 1,
                          delay: 440.ms,
                          duration: 600.ms,
                          curve: Curves.easeInOut,
                        )
                      ],
                      child: GradientAnimationText(
                        text: Text(
                          "Gemini",
                          style: GoogleFonts.manrope(
                              fontSize: 140,
                              color: Colors.white,
                              height: 1,
                              fontWeight: FontWeight.w500),
                        ),
                        colors: [Color(0xFFffddb7), Color(0xff1a73e8)],
                        duration: Duration(seconds: 5),
                        transform: GradientRotation(pi / 4), // tranform
                      ),
                    ),
                    Gap(20),
                    Animate(
                      target: target,
                      effects: [
                        SlideEffect(
                            begin: Offset(0, 1),
                            end: Offset(0, 0),
                            delay: 460.ms,
                            curve: Curves.easeInOut,
                            duration: 600.ms),
                        FadeEffect(
                          begin: 0,
                          end: 1,
                          delay: 460.ms,
                          duration: 600.ms,
                          curve: Curves.easeInOut,
                        )
                      ],
                      child: Text(
                        "era",
                        style: GoogleFonts.manrope(
                            fontSize: 140,
                            color: Colors.white,
                            height: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Gap(20),
                Visibility(
                    maintainAnimation: false,
                    visible: visible,
                    child: FloatingNavBar())
              ],
            );
          },
        ));
  }
}

class FloatingNavBar extends StatefulWidget {
  const FloatingNavBar({super.key});

  @override
  State<FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width / 1.8,
      decoration: BoxDecoration(
        color: Color(0xff474345),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The Gemini era",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16),
              ),
              Animate(
                effects: [
                  SlideEffect(
                      begin: Offset(-0.8, 0),
                      end: Offset(0, 0),
                      delay: 100.ms,
                      duration: 1000.ms),
                ],
                child: Container(
                  height: 2,
                  width: 110,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.1, 0.9],
                          colors: [Color(0xFFffddb7), Color(0xff4387ea)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                ).animate().scaleX(
                    duration: 1000.ms,
                    delay: 100.ms,
                    begin: 0,
                    end: 1,
                    curve: Curves.easeInOut),
              )
            ],
          ),
          Gap(10),
          Text(
            "Capabilities",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Hands-on",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Safety",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Bard",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Build with Gemini",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
        ],
      ),
    );
  }
}

class FloatingNavBarScreen1 extends StatefulWidget {
  const FloatingNavBarScreen1({super.key});

  @override
  State<FloatingNavBarScreen1> createState() => FloatingNavBarScreen1State();
}

class FloatingNavBarScreen1State extends State<FloatingNavBarScreen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width / 1.8,
      decoration: BoxDecoration(
        color: Color(0xff474345),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The Gemini era",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16),
              ),
              Container(
                height: 2,
                width: 110,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: [0.1, 0.9],
                        colors: [Color(0xFFffddb7), Color(0xff4387ea)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
              )
            ],
          ),
          Gap(10),
          Text(
            "Capabilities",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Hands-on",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Safety",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Bard",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
          Text(
            "Build with Gemini",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                color: Color(0xff767474),
                fontSize: 16),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
