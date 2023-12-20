import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

import 'animatedBox.dart';
import 'animatedBoxThree.dart';
import 'animatedBoxTwo.dart';

class AnimatedBoxPage extends StatefulWidget {
  const AnimatedBoxPage({super.key});

  @override
  State<AnimatedBoxPage> createState() => _AnimatedBoxPageState();
}

class _AnimatedBoxPageState extends State<AnimatedBoxPage> {
  double target = 0.0;
  bool flag = false;
  double start = 0;
  double end = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff070607),
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is ScrollBarOffsetValue) {
                if (state.offset > 2050 &&
                    state.offset < 2800 &&
                    flag == false) {
                  target = 1.0;
                } else if (state.offset < 2800 &&
                    flag == true &&
                    state.offset > 2050) {
                  target = 0.0;
                } else if (state.offset > 2800) {
                  target = 1.0;
                  flag = true;
                  start = 1.0;
                  end = 0.0;
                } else if (state.offset < 2800) {
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
                if (current.offset > 2000 && current.offset < 2854) {
                  return true;
                }
              }
              return false;
            },
            builder: (context, state) {
              // print("here we are $target");
              return Text(
                "Gemini comes in three sizes",
                style: GoogleFonts.manrope(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ).animate(
                target: target,
                effects: [
                  SlideEffect(
                      begin: Offset(0, 0),
                      end: Offset(0, -0.8),
                      curve: Curves.easeInOut,
                      duration: 1000.ms),
                  FadeEffect(
                      begin: start,
                      end: end,
                      curve: Curves.easeInOut,
                      duration: 1000.ms)
                ],
              );
            },
          ),
          Gap(120),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 300,
                      height: 300,
                      child: Center(child: AnimatedBoxThree())),
                  Gap(20),
                  Container(
                    height: 100,
                    width: 250,
                    child: Text(
                      "Our most capable and largest model for highly-complex tasks.",
                      style: GoogleFonts.openSans(
                          color: Color(0xff8e9ba8),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 210,
                      height: 300,
                      child: Center(child: AnimatedBoxTwo())),
                  Gap(20),
                  Container(
                    height: 100,
                    width: 250,
                    child: Text(
                      "Our best model for scaling across a wide range of tasks.",
                      style: GoogleFonts.manrope(
                          color: Color(0xff8e9ba8),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 180,
                      height: 300,
                      child: Center(child: AnimatedBox())),
                  Gap(20),
                  Container(
                    height: 100,
                    width: 250,
                    child: Text(
                      "Our most efficient model for on-device tasks.",
                      style: GoogleFonts.manrope(
                          color: Color(0xff8e9ba8),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
