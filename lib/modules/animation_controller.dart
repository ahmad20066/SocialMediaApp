// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  late Animation<double> sizeAnimation = TweenSequence([
    TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
    TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50)
  ]).animate(animationController);
}
