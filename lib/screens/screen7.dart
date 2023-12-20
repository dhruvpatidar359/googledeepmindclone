import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

class Screen7 extends StatefulWidget {
  const Screen7({super.key});

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  double target = 0.0;
  bool flag = false;
  double start = 0;
  double end = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ScrollBarOffsetValue) {
          if (state.offset > 3900 && state.offset < 4770 && flag == false) {
            target = 1.0;
          } else if (state.offset < 4770 &&
              flag == true &&
              state.offset > 3900) {
            target = 0.0;
          } else if (state.offset > 4770) {
            target = 1.0;
            flag = true;
            start = 1.0;
            end = 0.0;
          } else if (state.offset < 4770) {
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
          if (current.offset > 3850 && current.offset < 4900) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        // print("we are printing these values $target");
        return Container(
            height: MediaQuery.sizeOf(context).height / 1.5,
            width: MediaQuery.sizeOf(context).width,
            color: const Color(0xff070607),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(100),
                Text("Hands-on with Gemini",
                    style: GoogleFonts.manrope(
                      fontSize: 70,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.2,
                    )),
                Gap(20),
                Text("Watch highlights from our testing of Gemini’s",
                    style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8e9ba8),
                        height: 1.2)),
                Text(
                  "multimodal reasoning capabilities. Curious to learn",
                  style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8e9ba8),
                      height: 1.2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "more?",
                      style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8e9ba8),
                          height: 1.2),
                    ),
                    Gap(2),
                    HoverTextStaticLined()
                  ],
                ),
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
              ),
            ]));
      },
    );
  }
}

class HoverTextStaticLined extends StatefulWidget {
  HoverTextStaticLined();

  @override
  State<HoverTextStaticLined> createState() => _HoverTextStaticLinedState();
}

class _HoverTextStaticLinedState extends State<HoverTextStaticLined> {
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
            "Explore our prompting techniques here.",
            style: GoogleFonts.manrope(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor:
                  isHovering == false ? Color(0xff8e9ba8) : Colors.white,
              decorationThickness: 2,
              color: Colors.transparent, // Step 2 SEE HERE
              shadows: [
                Shadow(
                  offset: Offset(0, -1),
                  color: isHovering == false ? Color(0xff8e9ba8) : Colors.white,
                )
              ],
              fontWeight: FontWeight.w500,

              height: 1.2,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
