import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AnimatedBoxThree extends StatefulWidget {
  const AnimatedBoxThree({Key? key}) : super(key: key);

  @override
  State<AnimatedBoxThree> createState() => _AnimatedBoxThreeState();
}

class _AnimatedBoxThreeState extends State<AnimatedBoxThree>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _rotateController;
  late AnimationController _gradeintController;
  late Timer _blueGradientTimer;
  late AnimationController _visiblityContoller;

  bool flag = false;
  bool hovering = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 800),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 800),
    );

    _rotateController.addStatusListener((status) {
      if (status == AnimationStatus.completed && hovering == false) {
        _rotateController.reverse();
        _animationController.reverse();
      }
    });

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

    _visiblityContoller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 4),
        reverseDuration: const Duration(seconds: 4));
    _visiblityContoller.addStatusListener((status) {
      if (_visiblityContoller.isCompleted) {
        _visiblityContoller.reverse();
      }
    });
    _visiblityContoller.forward();
    _blueGradientTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      _visiblityContoller.forward();
    });

    _gradeintController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _rotateController.dispose();
    _gradeintController.dispose();
    _blueGradientTimer.cancel();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    if (isHovered) {
      hovering = true;
      _animationController.forward();
      _rotateController.forward();
    } else {
      if (_rotateController.status == AnimationStatus.completed) {
        _rotateController.reverse();
        _animationController.reverse();
      }
      hovering = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 230,
      width: 230,
      child: Center(
        child: Stack(alignment: Alignment.center, children: [
          Text(
            "Ultra",
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 34),
          ),
          InkWell(
            onHover: _onHover,
            onTap: () {},
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotateController
                          .drive(CurveTween(curve: Curves.easeOutQuad))
                          .value *
                      (3.14 / 4),
                  child: Container(
                    width: 300 -
                        _animationController
                                .drive(CurveTween(curve: Curves.easeOutQuad))
                                .value *
                            60,
                    height: 300 -
                        _animationController
                                .drive(CurveTween(curve: Curves.easeOutQuad))
                                .value *
                            60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          transform: GradientRotation(
                            _gradeintController.value * (2 * pi),
                          ),
                          stops: [
                            0.0,
                            0.5,
                            0.9,
                            1.0,
                          ],
                          colors: [
                            ColorTween(
                                    begin: Color(0xFFffddb7),
                                    end: Color(0xff4387ea))
                                .evaluate(_visiblityContoller)!,
                            Color(0xFFffddb7),
                            Color(0xFFffddb7),
                            ColorTween(
                                    begin: Color(0xFFffddb7),
                                    end: Color(0xff4387ea))
                                .evaluate(_visiblityContoller)!,
                          ],
                        ),
                        width: 6,
                      ),
                      borderRadius: BorderRadius.circular(
                        150 -
                            90 *
                                _animationController
                                    .drive(
                                        CurveTween(curve: Curves.easeOutQuad))
                                    .value, // Change from 45 to 100
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
