import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
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
          if (state.offset > 2800 && state.offset < 3713 && flag == false) {
            target = 1.0;
          } else if (state.offset < 3713 &&
              flag == true &&
              state.offset > 2800) {
            target = 0.0;
          } else if (state.offset > 3713) {
            target = 1.0;
            flag = true;
            start = 1.0;
            end = 0.0;
          } else if (state.offset < 3713) {
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
          if (current.offset > 2750 && current.offset < 3800) {
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
              Text("Anything to anything",
                  style: GoogleFonts.manrope(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.2,
                  )),
              Gap(20),
              Text("Gemini is natively multimodal, which gives you the",
                  style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8e9ba8),
                      height: 1.2)),
              Text(
                "potential to transform any type of input into any",
                style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8e9ba8),
                    height: 1.2),
              ),
              Text(
                "type of output.",
                style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8e9ba8),
                    height: 1.2),
              )
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
          ]),
        );
      },
    );
  }
}
