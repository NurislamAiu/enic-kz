import 'package:flutter/material.dart';

import 'animated_feature_card.dart';

class FeatureGridSection extends StatelessWidget {
  final List<Map<String, String>> items;

  const FeatureGridSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth < 768
              ? 1
              : constraints.maxWidth < 1024
              ? 2
              : 4;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return AnimatedFeatureCard(
                title: item['title']!,
                routeName: item['route']!,
                delay: Duration(milliseconds: 100 * index),
              );
            },
          );
        },
      ),
    );
  }
}