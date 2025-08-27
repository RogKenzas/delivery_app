import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingHero extends StatelessWidget {
  final String imagePath;
  const OnboardingHero({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, fit: BoxFit.contain);
  }
}
