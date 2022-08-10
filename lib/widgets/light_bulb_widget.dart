import 'package:flutter/material.dart';
import 'package:staggered_animation_example/widgets/light_painter.dart';

class LightBulbWidget extends StatelessWidget {
  const LightBulbWidget(
    this._animationController,
    this._colorAnim, {
    Key? key,
  }) : super(key: key);
  final AnimationController _animationController;
  final Animation<Color?> _colorAnim;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: Container(
          height: 25,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
        ),
        builder: (context, child) {
          return CustomPaint(
            painter: LightPainter(_colorAnim.value!),
            child: child,
          );
        });
  }
}

TweenSequence<Color?> bgColor = TweenSequence([
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.yellow.withOpacity(0.5), end: Colors.white),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.yellow.withOpacity(0.5), end: Colors.white),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.white, end: Colors.yellow.withOpacity(0.5)),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.yellow.withOpacity(0.5), end: Colors.white),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.yellow.withOpacity(0.5), end: Colors.white),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.yellow.withOpacity(0.5), end: Colors.white),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.white, end: Colors.yellow.withOpacity(0.5)),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.yellow.withOpacity(0.5), end: Colors.white),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(begin: Colors.white, end: Colors.yellow.withOpacity(0.5)),
  ),
]);
