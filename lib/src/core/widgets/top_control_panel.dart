import 'package:flutter/material.dart';

class TopControlPanel extends StatelessWidget {
  const TopControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    const brandColor = Color(0xFF1F327D);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Row(
        children: [
          // ENIC - KAZAKHSTAN
          const Text(
            'ENIC - KAZAKHSTAN',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: brandColor,
              letterSpacing: 0.5,
            ),
          ),

          const Spacer(),

          // Language selector
          const Text(
            'KZ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 24),

          // Search Icon
          _IconBtn(icon: Icons.search),

          const SizedBox(width: 16),

          // Facebook Icon
          _IconBtn(icon: Icons.facebook),

          const SizedBox(width: 16),

          // Profile Icon
          _IconBtn(icon: Icons.person_outline),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  const _IconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(icon, size: 20, color: Colors.black87),
      ),
    );
  }
}
