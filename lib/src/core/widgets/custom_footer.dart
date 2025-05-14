import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111827),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Wrap(
            spacing: 64,
            runSpacing: 40,
            children: const [
              _FooterColumn(
                title: 'Орталық',
                items: ['Миссия', 'Құрылымы', 'Басшылық', 'Контакты'],
              ),
              _FooterColumn(
                title: 'Қызметтер',
                items: ['Аккредиттеу', 'Реестр', 'ББ Тізілімі'],
              ),
              _FooterColumn(
                title: 'Құжаттар',
                items: ['ЕСG', 'Ұлттық жүйе', 'Халықаралық жобалар'],
              ),
              _FooterContactBlock(),
            ],
          ),
          const SizedBox(height: 48),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2023 Жоғары білім беруді дамыту ұлттық орталығы',
                style: TextStyle(color: Colors.grey[400], fontSize: 13),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Разработано в AIU',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2)),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                item,
                style: const TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class _FooterContactBlock extends StatelessWidget {
  const _FooterContactBlock();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Байланыс',
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _ContactLine(icon: Icons.location_on_outlined, text: 'Астана, Сығанақ 70'),
          _ContactLine(icon: Icons.phone, text: '+7 (7172) 57-20-75'),
          _ContactLine(icon: Icons.email_outlined, text: 'cbpiam@n-k.kz'),
        ],
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactLine({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white54),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          )
        ],
      ),
    );
  }
}