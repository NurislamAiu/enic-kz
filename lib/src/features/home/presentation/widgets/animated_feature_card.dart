
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimatedFeatureCard extends StatefulWidget {
  final String title;
  final String routeName;
  final Duration delay;

  const AnimatedFeatureCard({super.key,
    required this.title,
    required this.routeName,
    required this.delay,
  });

  @override
  State<AnimatedFeatureCard> createState() => AnimatedFeatureCardState();
}

class AnimatedFeatureCardState extends State<AnimatedFeatureCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slide = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() => _controller.dispose();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).go(widget.routeName);
        },
        child: SlideTransition(
          position: _slide,
          child: FadeTransition(
            opacity: _opacity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isHovered ? const Color(0xFFEAF7FD) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isHovered ? const Color(0xFF0288D1) : Colors.grey.shade300,
                  width: 1.5,
                ),
                boxShadow: isHovered
                    ? [
                  BoxShadow(
                    color: const Color(0xFF0288D1).withOpacity(0.1),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  )
                ]
                    : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Көшу",
                          style: TextStyle(
                            color: Color(0xFF0288D1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16, color: Color(0xFF0288D1)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}