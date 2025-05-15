import 'package:flutter/material.dart';

class FeatureGridSection extends StatelessWidget {
  final List<Map<String, String>> items;

  const FeatureGridSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Жоғары білім бойынша ақпараттық ресурстар',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Барлығын қарау',
                    style: TextStyle(
                      color: Color(0xFF2A5ACF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _ResourceTile(
                title: item['title']!,
                route: item['route']!,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _ResourceTile extends StatefulWidget {
  final String title;
  final String route;

  const _ResourceTile({required this.title, required this.route});

  @override
  State<_ResourceTile> createState() => _ResourceTileState();
}

class _ResourceTileState extends State<_ResourceTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2A5ACF)),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                // Заголовок
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Кнопка "Ашу"
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, widget.route);
                  },
                  child: Row(
                    children: const [
                      Text(
                        'Ашу',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2A5ACF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, size: 15, color: Color(0xFF2A5ACF)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}