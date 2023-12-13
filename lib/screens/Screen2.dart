import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      width: MediaQuery.sizeOf(context).width,
      color: Color(0xff070607),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(100),
          Text(
            "Gemini is built from the ground up for",
            style: GoogleFonts.manrope(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                'multimodality',
                style: GoogleFonts.manrope(
                    fontSize: 48, fontWeight: FontWeight.w500, height: 1),
                colors: [Color(0xff559af2), Color(0xff98b7ea)],
              ),
              Text(
                " — reasoning seamlessly across",
                style: GoogleFonts.manrope(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1),
              ),
            ],
          ),
          Text(
            "text, images, video, audio, and code.",
            style: GoogleFonts.manrope(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1),
          ),
        ],
      ),
    );
  }
}
