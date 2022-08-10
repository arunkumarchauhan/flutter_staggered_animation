import 'package:flutter/material.dart';
import 'package:staggered_animation_example/widgets/light_bulb_widget.dart';
import 'dart:math' as math;

class LightWithRodWidget extends StatelessWidget {
  const LightWithRodWidget({
    Key? key,
    required AnimationController animationController,
    required Animation<Color?> colorAnim,
    required this.rotationAnime,
    required this.lightFadeAnime,
  })  : _animationController = animationController,
        _colorAnim = colorAnim,
        super(key: key);

  final AnimationController _animationController;
  final Animation<Color?> _colorAnim;
  final Animation<double> rotationAnime;
  final Animation<double> lightFadeAnime;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAnime.value * math.pi * 2,
      child: Opacity(
        opacity: 1 - lightFadeAnime.value,
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 200,
                color: Colors.black,
              ),
              Container(
                width: 150,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                    stops: [0, 0.5, 0.5, 1],
                    colors: [
                      Colors.red,
                      Colors.red,
                      Colors.deepOrange,
                      Colors.deepOrange
                    ],
                  ),
                ),
              ),
              LightBulbWidget(_animationController, _colorAnim)
            ],
          ),
        ),
      ),
    );
  }
}
