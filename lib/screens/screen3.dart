import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/scrollBloc/scroll_bar_offset_bloc.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with SingleTickerProviderStateMixin {
  double target = 0.0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScrollBarOffsetBloc, ScrollBarOffsetState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ScrollBarOffsetValue) {
          if (state.offset > 550) {
            target = 1.0;
          } else {
            target = 0.0;

            // print("chaning the value to 0");
          }
          // if (state.offset < 1700) {
          //
          // }
        }
      },
      buildWhen: (previous, current) {
        if (current is ScrollBarOffsetValue) {
          if (current.offset > 300 && current.offset < 1336) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        // print("we are printing these values $target");
        return Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          color: const Color(0xff070607),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(100),
              Text("The Gemini era",
                  style: GoogleFonts.manrope(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1,
                  )).animate(
                target: target,
                effects: [
                  SlideEffect(
                      begin: Offset(0, 1),
                      end: Offset(0, 0),
                      delay: 200.ms,
                      curve: Curves.easeInOut,
                      duration: 600.ms),
                  FadeEffect(
                    begin: 0,
                    end: 1,
                    delay: 200.ms,
                    duration: 600.ms,
                    curve: Curves.easeInOut,
                  )
                ],
              ),
              Gap(20),
              Text("Gemini represents a significant leap forward in how AI can",
                      style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8e9ba8),
                          height: 1))
                  .animate(
                target: target,
                effects: [
                  SlideEffect(
                      begin: Offset(0, 1),
                      end: Offset(0, 0),
                      delay: 200.ms,
                      curve: Curves.easeInOut,
                      duration: 600.ms),
                  FadeEffect(
                    begin: 0,
                    end: 1,
                    delay: 200.ms,
                    duration: 600.ms,
                    curve: Curves.easeInOut,
                  )
                ],
              ),
              Text(
                "help improve our daily lives.",
                style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8e9ba8),
                    height: 1),
              ).animate(
                target: target,
                effects: [
                  SlideEffect(
                      begin: Offset(0, 1),
                      end: Offset(0, 0),
                      delay: 200.ms,
                      curve: Curves.easeInOut,
                      duration: 600.ms),
                  FadeEffect(
                    begin: 0,
                    end: 1,
                    delay: 200.ms,
                    duration: 600.ms,
                    curve: Curves.easeInOut,
                  )
                ],
              ),
              Gap(40),
              AnimatedButton(
                string: "Read the blog post",
              ).animate(
                target: target,
                effects: [
                  SlideEffect(
                      begin: Offset(0, 1),
                      end: Offset(0, 0),
                      delay: 250.ms,
                      curve: Curves.easeInOut,
                      duration: 600.ms),
                  FadeEffect(
                    begin: 0,
                    end: 1,
                    delay: 250.ms,
                    duration: 600.ms,
                    curve: Curves.easeInOut,
                  )
                ],
              ),
              Gap(100),
            ],
          ),
        );
      },
    );
  }
}

class AnimatedButton extends StatefulWidget {
  AnimatedButton({Key? key, required this.string}) : super(key: key);

  String string;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
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
                  color: isHovered ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  border: isHovered ? null : Border.all(color: Colors.grey),
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
