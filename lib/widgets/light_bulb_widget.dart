import 'package:flutter/material.dart';
import 'package:staggered_animation_example/widgets/light_painter.dart';

class LightBulbWidget extends StatefulWidget {
  const LightBulbWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LightBulbWidget> createState() => _LightBulbWidgetState();
}

class _LightBulbWidgetState extends State<LightBulbWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnim;
  
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _colorAnim = bgColor.animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeIn)));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
