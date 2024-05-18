import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  final String title;
  final Widget child;

  const DetailsSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
