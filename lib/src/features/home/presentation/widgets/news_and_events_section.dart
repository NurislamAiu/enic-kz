import 'package:enic_kz_web/src/features/home/presentation/widgets/title_section.dart';
import 'package:flutter/material.dart';

import 'event_section.dart';
import 'news_section.dart';

class NewsAndEventsSection extends StatelessWidget {
  const NewsAndEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F6FB),
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle('Жаңалықтар', 'Барлык жаңалықтар'),
          SizedBox(height: 32),
          NewsCardList(),
          SizedBox(height: 48),
          SectionTitle('Оқиғалар', 'Барлык оқиғалар'),
          SizedBox(height: 24),
          EventTimeline(),
        ],
      ),
    );
  }
}
