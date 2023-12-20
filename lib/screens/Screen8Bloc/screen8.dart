import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googledeepmind/screens/Screen8Bloc/screen8Bloc.dart';
import 'package:googledeepmind/screens/Screen8Bloc/screen8Model.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Screen8 extends StatefulWidget {
  const Screen8({super.key});

  @override
  State<Screen8> createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  List<Screen8Model> videolist = [
    Screen8Model("I.", "Multimodal Dialogue", 19),
    Screen8Model("II.", "Multilinguality", 92),
    Screen8Model("III.", "Game Creation", 124),
    Screen8Model("IV.", "Visual Puzzles", 151),
    Screen8Model("V.", "Making Connections", 197),
    Screen8Model("VI.", "Image & Text Generation", 219),
    Screen8Model("VII.", "Logic & Spatial Reasoning", 246),
    Screen8Model("VIII.", "Translating Visuals", 295),
    Screen8Model("XI.", "Cultural Understanding", 327),
  ];

  int selectedButtonIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    context.read<Screen8Bloc>().add(StaticPlayerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 4,
      width: MediaQuery.sizeOf(context).width,
      color: const Color(0xff070607),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Stack(children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: videolist.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Gap(20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedButtonIndex = index;
                        context.read<Screen8Bloc>().add(YoutubePlayerEvent(
                            seekPosition:
                                videolist.elementAt(index).seekPosition));
                      });
                    },
                    child: Center(
                      child: SeekButtons(
                        title: videolist.elementAt(index).name,
                        number: videolist.elementAt(index).number,
                        seekPosition: videolist.elementAt(index).seekPosition,
                        isSelected: index == selectedButtonIndex,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [const Color(0xff070607), Colors.transparent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [const Color(0xff070607), Colors.transparent],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft)),
            ),
          )
        ])),
      ),
    );
  }
}

class SeekButtons extends StatelessWidget {
  SeekButtons(
      {required this.number,
      required this.title,
      required this.seekPosition,
      required this.isSelected});

  String number;
  String title;
  int seekPosition;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    Color beg = isSelected ? Color(0xff4387ea) : Color(0xff2e2f2f);
    Color end = isSelected ? Color(0xFFffddb7) : Color(0xff2e2f2f);
    List<Color> textC = isSelected
        ? [Color(0xffb1b0b1), Color(0xfffefffe)]
        : [Color(0xff8e9ba8), Color(0xff8e9ba8)];

    return Container(
      width: 250,
      height: 120,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.1, 0.9],
                    colors: [beg, end],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GradientText(
                number,
                colors: textC,
                style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GradientText(
                title,
                colors: textC,
                style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
