import 'package:flutter/material.dart';
import 'package:staggered_animation_example/widgets/cupboard.dart';
import 'package:staggered_animation_example/widgets/light_bulb_widget.dart';
import 'package:staggered_animation_example/widgets/light_with_rod_widget.dart';
import 'package:staggered_animation_example/widgets/table_widget.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({Key? key}) : super(key: key);

  @override
  State<AnimationHomePage> createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _cupboardHeightAnime;
  late Animation<double> _cupboardRotateAnime;
  // late Tween<double> _cupboardHeight1Tween;
  // late Tween<double> _cupboardHeight2Tween;
  // late Tween<double> _cupboardHeight3Tween;
  // late TweenSequence<double> _cupboardHeightTweenSequence;
  late Animation<Color?> _lightBulbColorAnim;
  late Animation<double> _rotateLightBulbAnime;
  late final Animation<double> _lightFadeAnime;
  late final Animation<double> _cupboardFadeAnime;
  late final Animation<double> _tableHeightAnmation;
  late Animation<double> _tableRotateAnime;
  late final Animation<double> _tableFadeAnime;
  bool _isDrawer = true;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);

    // CupBoard Animation
    //=================================================================//

    _cupboardHeightAnime = cupboardHeightTweenSequence.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceIn),
      ),
    );
    _cupboardRotateAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.25,
        0.3,
        curve: Curves.elasticInOut,
      ),
    );

    _cupboardFadeAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.25, 0.3, curve: Curves.easeIn),
    );

//Table Animation
//=================================================================//

    _tableHeightAnmation = tableHeightTweenSequence.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.55, curve: Curves.bounceIn),
      ),
    );
    _tableRotateAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.55,
        0.6,
        curve: Curves.elasticInOut,
      ),
    );

    _tableFadeAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.55, 0.6, curve: Curves.easeIn),
    );

    //=================================================================//
    // Light-Bulb Animation
    _lightBulbColorAnim = bgColor.animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 0.9, curve: Curves.easeIn)));

    _rotateLightBulbAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.9,
        1,
        curve: Curves.elasticInOut,
      ),
    );

    _lightFadeAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.9, 1, curve: Curves.easeIn),
    );

    _animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    _animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_animationController.value > 0.6 &&
                _animationController.value <= 1)
              LightWithRodWidget(
                animationController: _animationController,
                colorAnim: _lightBulbColorAnim,
                rotationAnime: _rotateLightBulbAnime,
                lightFadeAnime: _lightFadeAnime,
              ),
            if (_animationController.value >= 0 &&
                _animationController.value <= 0.3)
              CupBoard(_animationController, _cupboardHeightAnime,
                  _cupboardRotateAnime, _cupboardFadeAnime),
            if (_animationController.value > 0.3 &&
                _animationController.value <= 0.6)
              TableWidget(
                fadeAnimation: _tableFadeAnime,
                heightAnimation: _tableHeightAnmation,
                rotationAnimation: _tableRotateAnime,
              )
          ],
        ),
      ),
    );
  }
}
