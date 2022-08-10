import 'package:flutter/material.dart';
import 'dart:math' as math;

class CupBoard extends StatelessWidget {
  const CupBoard(
    this._animationController,
    this._heightAnime,
    this._rotateAnime,
    this._cupboardAnime, {
    Key? key,
  }) : super(key: key);

  final Animation<double> _rotateAnime;
  final AnimationController _animationController;
  final Animation<double> _heightAnime;
  final Animation<double> _cupboardAnime;
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotateAnime,
      child: Opacity(
        opacity: 1 - _cupboardAnime.value,
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
      ),
    );
  }
}

final _cupboardHeight1Tween = Tween<double>(
  begin: 200,
  end: 300,
);

final _cupboardHeight2Tween = Tween<double>(
  begin: 300,
  end: 280,
);
final _cupboardHeight3Tween = Tween<double>(
  begin: 280,
  end: 300,
);
final cupboardHeightTweenSequence = TweenSequence([
  TweenSequenceItem(tween: _cupboardHeight1Tween, weight: 2),
  TweenSequenceItem(tween: _cupboardHeight2Tween, weight: 2),
  TweenSequenceItem(tween: _cupboardHeight3Tween, weight: 1),
]);

final rotateTweenSequence = TweenSequence([
  TweenSequenceItem(
      tween: Tween<double>(begin: 0.0, end: 10 * math.pi / 180), weight: 1),
  TweenSequenceItem(
      tween: Tween<double>(begin: 10 * math.pi / 180, end: 0), weight: 1),
  TweenSequenceItem(
      tween: Tween<double>(begin: 0.0, end: 10 * math.pi / 180), weight: 1)
]);
