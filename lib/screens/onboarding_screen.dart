import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed/screens/home_screen.dart';
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
    'assets/img/Shipping-Team-OE-768x485.png',
    'assets/img/1.jpg',
    'assets/img/2.jpg',
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageDots(count: 3, activeIndex: _index),
                  _ForwardButton(),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemCount: _images.length,
                  itemBuilder:
                      (context, i) => OnboardingHero(imagePath: _images[i]),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: PageDots(count: _images.length, activeIndex: _index),
              ),
              const SizedBox(height: 8),
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  PrimaryButton(
                    label: 'Start Now',
                    trailingIcon: CupertinoIcons.chevron_right_2,
                    onPressed: () {
                      NavigationHelper.pushReplacementFade(
                        context,
                        const HomeScreen(),
                      );
                    },
                  ),
                  _RoundedNavButton(
                    icon: CupertinoIcons.chevron_forward,
                    onTap: () {
                      if (_index < _images.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeOutCubic,
                        );
                      } else {
                        NavigationHelper.pushReplacementFade(
                          context,
                          const HomeScreen(),
                        );
                      }
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

class _ForwardButton extends StatelessWidget {
  const _ForwardButton();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 48, height: 48);
  }
}
