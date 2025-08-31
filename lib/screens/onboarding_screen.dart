import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// removed unused home_screen import
import 'package:seed/screens/auth/login_screen.dart';
import 'package:seed/theme/design_system.dart';
import 'package:seed/utils/navigation_helper.dart';
import 'package:seed/widgets/onboarding_hero.dart';
import 'package:seed/widgets/page_dots.dart';
import 'package:seed/widgets/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<String> _images = const [
    'assets/img/3.png',
    'assets/img/1.jpg',
    'assets/img/2.jpg',
    'assets/img/3.png',
    'assets/img/1.jpg',
    'assets/img/2.jpg',
    'assets/img/3.png',
    'assets/img/1.jpg',
    'assets/img/2.jpg',
  ];
  int _index = 0;
  Timer? _autoTimer;

  @override
  void initState() {
    super.initState();
    _autoTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      final next = (_index + 1) % _images.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _autoTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 0, 20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemCount: _images.length,
                  itemBuilder:
                      (context, i) => OnboardingHero(imagePath: _images[i]),
                ),
              ),
              Center(
                child: PageDots(count: _images.length, activeIndex: _index),
              ),
              const SizedBox(height: 16),
              Text(
                'Your Package,\nOur Commitment',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutralBlack,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your package is our priority. We ensure safe, timely\n'
                'delivery with dedication, reliability, and customer\n'
                'satisfaction.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _RoundedNavButton(
                    icon: CupertinoIcons.chevron_back,
                    onTap: () {
                      if (_index > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeOutCubic,
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 24),
                  PrimaryButton(
                    label: 'Start Now',
                    trailingIcon: CupertinoIcons.chevron_right,
                    onPressed: () {
                      NavigationHelper.pushReplacementFade(
                        context,
                        const LoginScreen(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoundedNavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _RoundedNavButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
