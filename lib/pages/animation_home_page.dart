import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:staggered_animation_example/widgets/cupboard.dart';
import 'package:staggered_animation_example/widgets/light_bulb_widget.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({Key? key}) : super(key: key);

  @override
  State<AnimationHomePage> createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage>
    with SingleTickerProviderStateMixin {
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
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
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

    _heightAnime = heightTweenSequence.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.3, curve: Curves.bounceIn),
      ),
    );
    _rotateAnime = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.elasticInOut,
      ),
    );
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CupBoard(),
            SizedBox(
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
                  LightBulbWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
