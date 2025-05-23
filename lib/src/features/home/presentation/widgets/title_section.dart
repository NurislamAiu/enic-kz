import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String onTap;

  const SectionTitle(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1F327D)),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            onTap,
            style: const TextStyle(
              color: Color(0xFF2A5ACF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}