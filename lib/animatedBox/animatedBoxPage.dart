import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animatedBox.dart';
import 'animatedBoxThree.dart';
import 'animatedBoxTwo.dart';

class AnimatedBoxPage extends StatefulWidget {
  const AnimatedBoxPage({super.key});

  @override
  State<AnimatedBoxPage> createState() => _AnimatedBoxPageState();
}

class _AnimatedBoxPageState extends State<AnimatedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Gemini comes in three sizes",
            style: GoogleFonts.manrope(
                fontSize: 48, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 300, height: 300, child: AnimatedBoxThree()),
                  Gap(20),
                  Container(
                    height: 100,
                    width: 250,
                    child: Text(
                      "Our most capable and largest model for highly-complex tasks.",
                      style: GoogleFonts.openSans(
                          color: Color(0xff8e9ba8),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 210, height: 300, child: AnimatedBoxTwo()),
                  Gap(20),
                  Container(
                    height: 100,
                    width: 250,
                    child: Text(
                      "Our best model for scaling across a wide range of tasks.",
                      style: GoogleFonts.manrope(
                          color: Color(0xff8e9ba8),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 180, height: 300, child: AnimatedBox()),
                  Gap(20),
                  Container(
                    height: 100,
                    width: 250,
                    child: Text(
                      "Our most efficient model for on-device tasks.",
                      style: GoogleFonts.manrope(
                          color: Color(0xff8e9ba8),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
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
