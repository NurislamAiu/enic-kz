import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureGridSection extends StatelessWidget {
  const FeatureGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    const darkBlue = Color(0xFF1F327D);
    const bgColor = Color(0xFFF5F7FA);

    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;
              return isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainBlock(darkBlue),
                      const SizedBox(height: 32),
                      _buildImage(),
                      const SizedBox(height: 32),
                      _buildSideTopics(context, darkBlue),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildMainBlock(darkBlue),
                            const SizedBox(height: 32),
                            _buildImage(),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: _buildSideTopics(context, darkBlue),
                      ),
                    ],
                  );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMainBlock(Color darkBlue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Часто задаваемые вопросы',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: darkBlue,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Ответы на популярные вопросы о системе образования',
          style: TextStyle(fontSize: 17, color: Colors.black87, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SvgPicture.asset(
        'assets/image/service.svg',
        fit: BoxFit.cover,
        height: 260,
        width: double.infinity,
      ),
    );
  }

  Widget _buildSideTopics(BuildContext context, Color color) {
    final importantItems = [
      {
        'title': '30 ОП ПО',
        'desc': 'Образовательные программы послевузовского образования',
      },
      {
        'title': 'Практика дистанционного обучения',
        'desc': 'Подходы и стандарты при онлайн обучении',
      },
      {
        'title': 'Качество образования',
        'desc': 'Система внутреннего обеспечения качества',
      },
      {
        'title': 'Академическая честность',
        'desc': 'Принципы академической этики и предотвращения плагиата',
      },
    ];

    final extraItems = [
      'Сопредседательство в Болонском процессе',
      'Научные исследования',
      'Отзывы',
      'Аккредитация',
      'Корпоративная этика',
      'Международные проекты',
      'Нац. система квалификаций',
      'Открытый доступ к образованию',
      'Привлечение зарубежных специалистов',
      'Автономия вузов',
      'Реестр образовательных программ',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...importantItems.map(
          (item) => _AnimatedTopicLine(
            title: item['title']!,
            description: item['desc']!,
            color: color,
          ),
        ),
        TextButton.icon(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder:
                  (_) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const Text(
                          'Дополнительные темы',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...extraItems.map(
                          (title) => ListTile(
                            leading: const Icon(Icons.arrow_right),
                            title: Text(title),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
            );
          },
          icon: const Icon(Icons.more_horiz),
          label: const Text('Подробнее о других темах'),
          style: TextButton.styleFrom(
            foregroundColor: color,
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class _AnimatedTopicLine extends StatefulWidget {
  final String title;
  final String description;
  final Color color;

  const _AnimatedTopicLine({
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  State<_AnimatedTopicLine> createState() => _AnimatedTopicLineState();
}

class _AnimatedTopicLineState extends State<_AnimatedTopicLine> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: widget.color,
                letterSpacing: 1.2,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 3,
              width: isHovered ? 40 : 0,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(2),
              ),
              margin: const EdgeInsets.only(bottom: 8),
            ),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}
