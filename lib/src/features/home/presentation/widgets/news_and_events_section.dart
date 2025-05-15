import 'dart:ui';
import 'package:flutter/material.dart';

class NewsAndEventsSection extends StatelessWidget {
  const NewsAndEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F6FB),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle('Жаңалықтар', 'Барлык жаңалықтар'),
            const SizedBox(height: 32),
            const _NewsList(),
            const SizedBox(height: 48),
            const _SectionTitle('Оқиғалар', 'Барлык оқиғалар'),
            const SizedBox(height: 24),
            const _EventTimeline(),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String onTap;

  const _SectionTitle(this.title, this.onTap);

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
            style: TextStyle(
              color: Color(0xFF2A5ACF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList();

  @override
  Widget build(BuildContext context) {
    final news = [
      {
        'title': 'Қазақстан мен Италия цифрлық трансформацияда ынтымақтастықты кеңейтуде',
        'date': '13 Мамыр 2025',
        'image': 'assets/image/news.jpeg',
      },
      {
        'title': 'PhD дәрежелерін тану жеңілдетілді',
        'date': '30 Қазан 2025',
        'image': 'assets/image/news.jpeg',
      },
      {
        'title': 'Бүкіл өмір бойы білім алу – жаңа мүмкіндік',
        'date': '28 Сәуір 2025',
        'image': 'assets/image/news.jpeg',
      },
    ];

    return Column(
      children: news
          .map((n) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: _GlassTile(
          image: n['image']!,
          title: n['title']!,
          date: n['date']!,
        ),
      ))
          .toList(),
    );
  }
}

class _GlassTile extends StatelessWidget {
  final String image;
  final String title;
  final String date;

  const _GlassTile({
    required this.image,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return _HoverScaleCard(
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // Image
              AspectRatio(
                aspectRatio: 1.3,
                child: Image.asset(image, fit: BoxFit.cover),
              ),

              // Text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class _EventTimeline extends StatelessWidget {
  const _EventTimeline();

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        'day': '05',
        'month': 'Сәуір',
        'title': 'Жаңа кәсіптердің атласы',
        'description': 'Кәсіптер болашағына арналған форум',
        'icon': Icons.business_center,
      },
      {
        'day': '30',
        'month': 'Қазан',
        'title': 'PhD дәрежесін тану',
        'description': 'Жаңа заң жобасы туралы кездесу',
        'icon': Icons.school_outlined,
      },
      {
        'day': '22',
        'month': 'Қазан',
        'title': 'Қазақстанның жоғары мектебі',
        'description': 'Журнал презентациясы мен талқылау',
        'icon': Icons.book_outlined,
      },
    ];

    return Column(
      children: List.generate(events.length, (index) {
        final event = events[index];
        final isLast = index == events.length - 1;

        return Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ║ Ось и точка
              Column(
                children: [
                  // 🔘 Элегантная точка
                  Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1F327D),
                    ),
                  ),
                  // ║ Тонкая ось
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 24),

              // 📝 Карточка события
              Expanded(
                child: _HoverScaleCard(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                          color: Colors.black.withOpacity(0.04),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${event['day']} ${event['month']}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F327D),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(event['icon'] as IconData, size: 20, color: Color(0xFF1F327D)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${event['title']!}'
                                ,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${event['description']!}',
                          style: const TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
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