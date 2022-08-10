import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    required this.fadeAnimation,
    required this.heightAnimation,
    required this.rotationAnimation,
    Key? key,
  }) : super(key: key);
  final Animation<double> heightAnimation;
  final Animation<double> rotationAnimation;
  final Animation<double> fadeAnimation;
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotationAnimation,
      child: Opacity(
        opacity: 1 - fadeAnimation.value,
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 250, height: 15, color: Colors.black),
              Container(
                width: 200,
                height: 50,
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
                      radius: 10,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: heightAnimation.value,
                      width: 15,
                      color: Colors.black),
                  Container(
                      height: heightAnimation.value,
                      width: 15,
                      color: Colors.black)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

final tableHeightTweenSequence = TweenSequence([
  TweenSequenceItem(tween: Tween<double>(begin: 130, end: 160), weight: 1),
  TweenSequenceItem(tween: Tween<double>(begin: 150, end: 120), weight: 1),
]);
