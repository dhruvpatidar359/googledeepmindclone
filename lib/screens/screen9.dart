import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../scrollBloc/scroll_bar_offset_bloc.dart';

class Screen9 extends StatefulWidget {
  const Screen9({super.key});

  @override
  State<Screen9> createState() => _Screen9State();
}

class _Screen9State extends State<Screen9> {
  double target = 0.0;
  bool flag = false;
  double start = 0;
  double end = 1;

  double target2 = 0.0;
  bool flag2 = false;
  double start2 = 0;
  double end2 = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ScrollBarOffsetValue) {
              if (state.offset > 7400 && state.offset < 8300 && flag == false) {
                target = 1.0;
              } else if (state.offset < 8300 &&
                  flag == true &&
                  state.offset > 7400) {
                target = 0.0;
              } else if (state.offset > 8300) {
                target = 1.0;
                flag = true;
                start = 1.0;
                end = 0.0;
              } else if (state.offset < 8300) {
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
              if (current.offset > 7350 && current.offset < 8400) {
                return true;
              }
            }
            return false;
          },
          builder: (context, state) {
            // print("we are printing these values $target");
            return Container(
              width: MediaQuery.sizeOf(context).width,
              color: const Color(0xff070607),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(100),
                  Text("The potential of Gemini",
                      style: GoogleFonts.manrope(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.2,
                      )),
                  Text("Gemini responsibly",
                      style: GoogleFonts.manrope(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.2,
                      )),
                ],
              ).animate(target: target, effects: [
                SlideEffect(
                  begin: Offset(0, -0.1),
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
              ]),
            );
          },
        ),
        BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ScrollBarOffsetValue) {
              if (state.offset > 7637 &&
                  state.offset < 8400 &&
                  flag2 == false) {
                target2 = 1.0;
              } else if (state.offset < 8400 &&
                  flag2 == true &&
                  state.offset > 7637) {
                target2 = 0.0;
              } else if (state.offset > 8400) {
                target2 = 1.0;
                flag2 = true;
                start2 = 1.0;
                end2 = 0.0;
              } else if (state.offset < 8400) {
                target2 = 0.0;
                start2 = 0.0;
                end2 = 1.0;
                flag2 = false;
              }
              // if (state.offset < 1700) {
              //
              // }
            }
          },
          buildWhen: (previous, current) {
            if (current is ScrollBarOffsetValue) {
              if (current.offset > 7600 && current.offset < 8400) {
                return true;
              }
            }
            return false;
          },
          builder: (context, state) {
            // print("we are printing these values $target");
            return Container(
              width: MediaQuery.sizeOf(context).width,
              color: const Color(0xff070607),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("We've built Gemini responsibly from the start,",
                      style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8e9ba8),
                      )),
                  Text(
                    "incorporating safeguards and working together with",
                    style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8e9ba8),
                    ),
                  ),
                  Text(
                    "partners to make it safer and more inclusive.",
                    style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8e9ba8),
                    ),
                  ),
                ],
              ).animate(target: target2, effects: [
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
              ]),
            );
          },
        ),
        Container(
          height: 100,
          color: const Color(0xff070607),
        )
      ],
    );
  }
}
