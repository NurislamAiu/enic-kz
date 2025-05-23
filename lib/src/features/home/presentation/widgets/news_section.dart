import 'package:flutter/material.dart';

class NewsCardList extends StatelessWidget {
  const NewsCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final news = [
      {
        'image': 'assets/image/news.jpeg',
        'headline': 'FUNDING WITHHELD',
        'title': 'Novel drug research',
        'description':
            'Wyss’ Don Ingber details the rush to hold onto consequential projects, talented researchers, and the system that has driven American innovation.',
      },
      {
        'image': 'assets/image/news.jpeg',
        'headline': 'FUNDING WITHHELD',
        'title': 'Tuberculosis research',
        'description':
            'Immunologist Sarah Fortune received a stop-work order from the federal government on April 15, instructing her to halt her world-class tuberculosis research.',
      },
      {
        'image': 'assets/image/news.jpeg',
        'headline': 'FUNDING WITHHELD',
        'title': 'ALS research',
        'description':
            'David Walt received a stop-work order from the Department of Health and Human Services for a National Institute of Health project focused on ALS.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children:
              news.map((item) {
                return SizedBox(
                  width:
                      isMobile
                          ? constraints.maxWidth
                          : (constraints.maxWidth - 48) / 3,
                  child: NewsCardOverlayStyle(
                    image: item['image']!,
                    headline: item['headline']!,
                    title: item['title']!,
                    description: item['description']!,
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}

class NewsCardOverlayStyle extends StatefulWidget {
  final String image;
  final String headline;
  final String title;
  final String description;

  const NewsCardOverlayStyle({
    super.key,
    required this.image,
    required this.headline,
    required this.title,
    required this.description,
  });

  @override
  State<NewsCardOverlayStyle> createState() => _NewsCardOverlayStyleState();
}

class _NewsCardOverlayStyleState extends State<NewsCardOverlayStyle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
            _hovered ? Matrix4.translationValues(0, -4, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_hovered ? 0.15 : 0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        height: 320,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [

              Positioned.fill(
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.8),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // ✏️ Контент
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.fiber_manual_record,
                          size: 10,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.headline,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0, end: _hovered ? 1 : 0),
                          duration: const Duration(milliseconds: 300),
                          builder: (context, value, child) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 2,
                                width: 100 * value,
                                margin: const EdgeInsets.only(top: 4),
                                color: Colors.orangeAccent.withOpacity(value),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverScaleCard extends StatefulWidget {
  final Widget child;

  const _HoverScaleCard({required this.child});

  @override
  State<_HoverScaleCard> createState() => _HoverScaleCardState();
}

class _HoverScaleCardState extends State<_HoverScaleCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
