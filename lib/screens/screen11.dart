import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

class Screen11 extends StatefulWidget {
  const Screen11({super.key});

  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends State<Screen11>
    with SingleTickerProviderStateMixin {
  late AnimationController _gradeintController;

  double target = 0.0;
  bool flag = false;
  double start = 0;
  double end = 1;

  @override
  void initState() {
    // TODO: implement initState

    _gradeintController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10000),
    )..repeat();

    _gradeintController.addListener(() => setState(() {}));
    _gradeintController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _gradeintController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _gradeintController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Color(0xff070607),
      child: Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height / 1.2,
          width: MediaQuery.sizeOf(context).width / 1.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2000),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              transform: GradientRotation(
                _gradeintController.value * (2 * pi),
              ),
              stops: [0.1, 0.9],
              colors: [Color(0xffe32550), Color(0xff4387ea)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bringing Gemini Pro to Bard",
                  style: GoogleFonts.manrope(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.2,
                  )),
              Gap(10),
              Text(
                  "Experience Gemini Pro in Bard and unlock new ways to create, plan, brainstorm, and more.",
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              Gap(20),
              BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is ScrollBarOffsetValue) {
                    if (state.offset > 8800 &&
                        state.offset < 9496 &&
                        flag == false) {
                      target = 1.0;
                    } else if (state.offset < 9496 &&
                        flag == true &&
                        state.offset > 8800) {
                      target = 0.0;
                    } else if (state.offset > 9496) {
                      target = 1.0;
                      flag = true;
                      start = 1.0;
                      end = 0.0;
                    } else if (state.offset < 9496) {
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
                    if (current.offset > 8750 && current.offset < 9540) {
                      return true;
                    }
                  }
                  return false;
                },
                builder: (context, state) {
                  return AnimatedButtonTransparentBack(
                      string: "   bard.google.com   ");
                },
              ).animate(target: target, effects: [
                SlideEffect(
                  begin: Offset(0, 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedButtonTransparentBack extends StatefulWidget {
  AnimatedButtonTransparentBack({Key? key, required this.string})
      : super(key: key);

  String string;

  @override
  State<AnimatedButtonTransparentBack> createState() =>
      _AnimatedButtonTransparentBackState();
}

class _AnimatedButtonTransparentBackState
    extends State<AnimatedButtonTransparentBack>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        isHovered = true;
        animationController.forward();
        setState(() {});
      },
      onExit: (event) {
        isHovered = false;
        animationController.reverse();
        setState(() {});
      },
      child: Stack(alignment: Alignment.center, children: [
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 + 0.1 * animationController.value,
              child: Container(
                width: widget.string.length * 12,
                height: 50,
                decoration: BoxDecoration(
                  color: isHovered ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: isHovered ? null : Border.all(color: Colors.white),
                ),
              ),
            );
          },
        ),
        Container(
          width: widget.string.length * 12,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.string,
                style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isHovered ? Color(0xff070607) : Colors.white,
                    height: 1),
              ),
              Gap(5),
              Icon(Icons.arrow_forward,
                      color: isHovered ? Color(0xff070607) : Colors.white)
                  .animate(
                    target: isHovered ? 1 : 0,
                  )
                  .slideX(duration: 200.ms, begin: 0, end: 0.2)
                  .then()
                  .slideX(duration: 200.ms, begin: 0.2, end: 0)
            ],
          ),
        ),
      ]),
    );
  }
}
