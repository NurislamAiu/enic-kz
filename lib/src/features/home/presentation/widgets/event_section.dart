import 'package:flutter/material.dart';

class EventTimeline extends StatelessWidget {
  const EventTimeline({super.key});

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
              // Ось и точка
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1F327D),
                    ),
                  ),
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

              // Карточка события с эффектом hover
              Expanded(
                child: _HoverScaleCard(
                  builder: (hovered) => Container(
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
                            Icon(event['icon'] as IconData,
                                size: 20, color: Color(0xFF1F327D)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _UnderlineTitle(
                                text: '${event['title']}',
                                showLine: hovered,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${event['description']}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
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

// Анимация масштаба и прокидывание hover-состояния
class _HoverScaleCard extends StatefulWidget {
  final Widget Function(bool hovered) builder;

  const _HoverScaleCard({required this.builder});

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
        child: widget.builder(_hovered),
      ),
    );
  }
}

// Заголовок с анимацией подчеркивания
class _UnderlineTitle extends StatelessWidget {
  final String text;
  final bool showLine;

  const _UnderlineTitle({required this.text, required this.showLine});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF1F327D);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: 2,
          width: showLine ? 40 : 0,
          margin: const EdgeInsets.only(top: 4),
          color: color,
        ),
      ],
    );
  }
}