import 'package:flutter/material.dart';

class PageDots extends StatelessWidget {
  final int count;
  final int activeIndex;
  const PageDots({super.key, required this.count, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final bool isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.black26,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
