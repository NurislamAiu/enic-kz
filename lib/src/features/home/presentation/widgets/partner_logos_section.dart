import 'dart:async';
import 'package:flutter/material.dart';

class PartnerLogoCarousel extends StatefulWidget {
  final List<String> logoPaths;

  const PartnerLogoCarousel({super.key, required this.logoPaths});

  @override
  State<PartnerLogoCarousel> createState() => _PartnerLogoCarouselState();
}

class _PartnerLogoCarouselState extends State<PartnerLogoCarousel> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _ticker;

  @override
  void initState() {
    super.initState();

    _ticker = AnimationController(vsync: this, duration: const Duration(hours: 1));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ticker.addListener(() {
        if (_scrollController.hasClients && _scrollController.position.hasContentDimensions) {
          final position = _scrollController.offset;
          final max = _scrollController.position.maxScrollExtent;
          final delta = 0.7;

          if (position + delta >= max) {
            _scrollController.jumpTo(0);
          } else {
            _scrollController.jumpTo(position + delta);
          }
        }
      });

      _ticker.forward();
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repeatedLogos = [...widget.logoPaths, ...widget.logoPaths, ...widget.logoPaths];

    return Container(
      color: const Color(0xFFF8FAFC),
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: repeatedLogos.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return _LargeLogoCard(imagePath: repeatedLogos[index]);
          },
        ),
      ),
    );
  }
}

class _LargeLogoCard extends StatefulWidget {
  final String imagePath;

  const _LargeLogoCard({required this.imagePath});

  @override
  State<_LargeLogoCard> createState() => _LargeLogoCardState();
}

class _LargeLogoCardState extends State<_LargeLogoCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(20),
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? const Color(0xFF0288D1) : Colors.grey.shade200,
            width: 1.4,
          ),
          boxShadow: isHovered
              ? [
            BoxShadow(
              color: const Color(0xFF0288D1).withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, 8),
            )
          ]
              : [],
        ),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 200),
          scale: isHovered ? 1.06 : 1.0,
          child: Image.asset(
            widget.imagePath,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}