import 'package:flutter/material.dart';
import 'dart:math' as math;

class CupBoard extends StatefulWidget {
  const CupBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<CupBoard> createState() => _CupBoardState();
}

class _CupBoardState extends State<CupBoard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnime;
  late Animation<double> _rotateAnime;
  late Tween<double> height1Tween;
  late Tween<double> height2Tween;
  late Tween<double> height3Tween;

  late TweenSequence<double> heightTweenSequence;

  @override
  void initState() {
    super.initState();
    height1Tween = Tween<double>(
      begin: 200,
      end: 300,
    );

    height2Tween = Tween<double>(
      begin: 300,
      end: 280,
    );
    height3Tween = Tween<double>(
      begin: 280,
      end: 300,
    );
    heightTweenSequence = TweenSequence([
      TweenSequenceItem(tween: height1Tween, weight: 2),
      TweenSequenceItem(tween: height2Tween, weight: 2),
      TweenSequenceItem(tween: height3Tween, weight: 1),
    ]);
    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _heightAnime = heightTweenSequence.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.bounceIn),
      ),
    );

    // _rotateAnime = rotateTweenSequence.animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: const Interval(
    //       0.7,
    //       1.0,
    //       curve: Curves.elasticInOut,
    //     ),
    //   ),
    // );

    _rotateAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.elasticInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotateAnime,
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    width: 200,
                    height: _heightAnime.value,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(colors: [
                        Colors.deepOrange,
                        Colors.deepOrange,
                        Colors.red,
                        Colors.red
                      ], stops: [
                        0,
                        0.5,
                        0.5,
                        1
                      ]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          maxRadius: 10,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(
                          maxRadius: 10,
                          backgroundColor: Colors.white,
                        )
                      ],
                    ),
                  );
                }),
            Container(
              height: 12,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: 12,
                  color: Colors.black,
                ),
                Container(
                  height: 20,
                  width: 12,
                  color: Colors.black,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

final rotateTweenSequence = TweenSequence([
  TweenSequenceItem(
      tween: Tween<double>(begin: 0.0, end: 10 * math.pi / 180), weight: 1),
  TweenSequenceItem(
      tween: Tween<double>(begin: 10 * math.pi / 180, end: 0), weight: 1),
  TweenSequenceItem(
      tween: Tween<double>(begin: 0.0, end: 10 * math.pi / 180), weight: 1)
]);
