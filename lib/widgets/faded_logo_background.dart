import 'package:flutter/material.dart';

class FadedLogoBackground extends StatelessWidget {
  final Widget child;

  const FadedLogoBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Opacity(
            opacity: 0.05,
            child: Image.asset(
              'assets/images/Legal Consultancy Logo with South African Flag.png',
              width: 300,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
