import 'package:flutter/material.dart';

class NewsAndEventsSection extends StatelessWidget {
  const NewsAndEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FAFC),
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Жаңалықтар",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F327D))),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: const [
                    _NewsCard(
                      imagePath: 'assets/image/news.jpeg',
                      title:
                      'Қазақстан мен Италия цифрлық трансформацияда ынтымақтастықты кеңейтуде',
                      date: '13 Мамыр 2025',
                      views: '8',
                    ),

                    _NewsCard(
                      imagePath: 'assets/image/news.jpeg',
                      title: 'Бүкіл өмір бойы білім алу – жаңа мүмкіндік',
                      date: '28 Сәуір 2025',
                      views: '186',
                    ),
                    _NewsCard(
                      imagePath: 'assets/image/news.jpeg',
                      title: 'Бүкіл өмір бойы білім алу – жаңа мүмкіндік',
                      date: '28 Сәуір 2025',
                      views: '186',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Барлық жаңалықтар"),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF1F327D),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(width: 48),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Оқиғалар күнтізбесі",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F327D))),
                const SizedBox(height: 32),
                const _EventCalendarItem(
                  day: '05',
                  month: 'Сәуір',
                  title: 'Жаңа кәсіптердің атласы',
                  views: '2534',
                ),
                const _EventCalendarItem(
                  day: '30',
                  month: 'Қазан',
                  title: 'PhD дәрежелерін тану жеңілдетілді',
                  views: '3057',
                ),
                const _EventCalendarItem(
                  day: '22',
                  month: 'Қазан',
                  title: '«Қазақстанның жоғары мектебі» журналы',
                  views: '2535',
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Барлық жаңалықтар"),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF1F327D),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String views;

  const _NewsCard({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 360, // 🎯 Задаём одинаковую высоту
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📸 Фиксированное изображение
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  imagePath,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // 📄 Контент
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🧾 Заголовок максимум в 2 строки
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
                          const SizedBox(width: 6),
                          Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(width: 10),
                          const Icon(Icons.remove_red_eye, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(views, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EventCalendarItem extends StatelessWidget {
  final String day;
  final String month;
  final String title;
  final String views;

  const _EventCalendarItem({
    required this.day,
    required this.month,
    required this.title,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1F327D),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(day,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(month,
                      style: const TextStyle(color: Colors.white70, fontSize: 10)),
                ],
              ),
            ),
            Container(
              width: 2,
              height: 40,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: _HoverableTitle(title: title, views: views),
          ),
        ),
      ],
    );
  }
}

class _HoverableTitle extends StatefulWidget {
  final String title;
  final String views;

  const _HoverableTitle({required this.title, required this.views});

  @override
  State<_HoverableTitle> createState() => _HoverableTitleState();
}

class _HoverableTitleState extends State<_HoverableTitle> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              print("Clicked: ${widget.title}");
            },
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: isHovered ? 16 : 14,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
              child: Text(widget.title),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.remove_red_eye_outlined, size: 13, color: Colors.grey),
            const SizedBox(width: 4),
            Text(widget.views, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}