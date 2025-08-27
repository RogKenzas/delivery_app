import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed/screens/onboarding_screen.dart';
import 'package:seed/theme/design_system.dart';
import 'package:seed/utils/navigation_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      NavigationHelper.pushReplacementFade(context, const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.splash),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      CupertinoIcons.cube_box_fill,
                      color: AppColors.brandPrimary,
                      size: 64,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('SEED DELIVERY', style: AppTextStyles.brandTitle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
