import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen13 extends StatefulWidget {
  const Screen13({super.key});

  @override
  State<Screen13> createState() => _Screen13State();
}

class _Screen13State extends State<Screen13> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      width: MediaQuery.sizeOf(context).width,
      color: Color(0xff070607),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Follow us",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff888c92)),
                ),
                Gap(30),
                Icon(FontAwesomeIcons.twitter, color: Color(0xff888c92)),
                Gap(30),
                Icon(FontAwesomeIcons.instagram, color: Color(0xff888c92)),
                Gap(30),
                Icon(FontAwesomeIcons.linkedin, color: Color(0xff888c92)),
                Gap(30),
                Icon(FontAwesomeIcons.youtube, color: Color(0xff888c92)),
                Gap(30),
                Icon(FontAwesomeIcons.github, color: Color(0xff888c92)),
              ],
            ),
            Gap(40),
            Container(height: 1, color: Colors.white),
            Gap(30),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff888c92)),
                    cursorColor: Color(0xff1363ee),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff888c92)),
                      hintText:
                          "Sign up for updates for our latest innovations",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff1363ee),
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Icon(
                          FontAwesomeIcons.envelope,
                          weight: 0.1,
                          size: 20,
                          color: Color(0xff888c92),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1d6fe8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(20),
            Row(
              children: [
                Text(
                  "I accept Google's Terms and Conditions and acknowledge that my information will be used in accordance with",
                  style: GoogleFonts.manrope(
                      fontSize: 14, color: Color(0xff888c92)),
                ),
                Text(
                  " Google's Privacy Policy.",
                  style: GoogleFonts.manrope(
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      decorationColor: Color(0xff888c92),
                      fontSize: 14,
                      color: Color(0xff888c92)),
                ),
              ],
            ),
            Gap(30),
            Container(height: 1, color: Colors.white),
            Gap(30),
            Row(
              children: [
                Text(
                  "Google",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff64676c)),
                ),
                Gap(40),
                Text(
                  "About Google",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff999da2)),
                ),
                Gap(20),
                Text(
                  "Google products ",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff999da2)),
                ),
                Gap(20),
                Text(
                  "Privacy",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff999da2)),
                ),
                Gap(20),
                Text(
                  "Terms",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff999da2)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
