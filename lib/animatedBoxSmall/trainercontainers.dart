import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/animatedBoxSmall/trainerBoxes.dart';
import 'package:googledeepmind/screens/screen3.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

class TrainerBox1 extends StatefulWidget {
  const TrainerBox1({super.key});

  @override
  State<TrainerBox1> createState() => _TrainerBox1State();
}

class _TrainerBox1State extends State<TrainerBox1> {
  double target = 0.0;
  bool flag = false;
  double start = 0;
  double end = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 2,
            child: TrainerBoxes(
                youtubeVideoId: "sPiOP_CB54A",
                image: "/images/potential05.jpg",
                name: "TAYLOR APPLEBAUM AND SEBASTIAN NOWOZIN",
                explain: "Unlocking insights in scientific literature"),
          ),
          Positioned(
            bottom: 5,
            left: 2,
            child: TrainerBoxes(
                youtubeVideoId: "LvGmVmHv69s",
                image: "/images/potential02.jpg",
                name: "RÉMI LEBLOND AND GABRIELA SURITA",
                explain: "Excelling at competitive programming"),
          )
        ],
      ),
    );
  }
}

class TrainerBox2 extends StatefulWidget {
  const TrainerBox2({super.key});

  @override
  State<TrainerBox2> createState() => _TrainerBox2State();
}

class _TrainerBox2State extends State<TrainerBox2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 200,
            child: TrainerBoxes(
                youtubeVideoId: "D64QD7Swr3s",
                image: "/images/potential01.jpg",
                name: "ADRIÀ RECASENS",
                explain:
                    "Processing and understanding raw audio signal end-to-end"),
          ),
        ],
      ),
    );
  }
}

class TrainerBox3 extends StatefulWidget {
  const TrainerBox3({super.key});

  @override
  State<TrainerBox3> createState() => _TrainerBox3State();
}

class _TrainerBox3State extends State<TrainerBox3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          gradient:
              RadialGradient(colors: [Color(0xff303342), Color(0xff070607)])),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 2,
            child: TrainerBoxes(
                youtubeVideoId: "K4pX1VAxaAI",
                image: "/images/potential04.jpg",
                name: "SAM CHEUNG",
                explain: "Explaining reasoning in math and physics"),
          ),
          Positioned(
            bottom: 5,
            right: 2,
            child: TrainerBoxes(
                youtubeVideoId: "v5tRc_5-8G4",
                image: "/images/potential03.jpg",
                name: "PALASH NANDY",
                explain:
                    "Reasoning about user intent to generate bespoke experiences"),
          )
        ],
      ),
    );
  }
}

class TrainerContainersText extends StatefulWidget {
  const TrainerContainersText({super.key});

  @override
  State<TrainerContainersText> createState() => _TrainerContainersTextState();
}

class _TrainerContainersTextState extends State<TrainerContainersText> {
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
          if (state.offset > 4978 && state.offset < 5926 && flag == false) {
            target = 1.0;
          } else if (state.offset < 5926 &&
              flag == true &&
              state.offset > 4978) {
            target = 0.0;
          } else if (state.offset > 5926) {
            target = 1.0;
            flag = true;
            start = 1.0;
            end = 0.0;
          } else if (state.offset < 5926) {
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
          if (current.offset > 4950 && current.offset < 5926) {
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
              Text("The potential of Gemini",
                  style: GoogleFonts.manrope(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.2,
                  )),
              Gap(20),
              Text("Learn about what Gemini can do from some of the",
                  style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8e9ba8),
                      height: 1)),
              Text(
                "people who built it",
                style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8e9ba8),
                    height: 1),
              ),
              Gap(20),
              AnimatedButton(
                string: "Read the blog post",
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
            )
          ]),
        );
      },
    );
  }
}
