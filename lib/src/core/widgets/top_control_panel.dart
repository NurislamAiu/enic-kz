import 'package:flutter/material.dart';

class TopControlPanel extends StatelessWidget {
  const TopControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          // 🔍 Поиск — НАЧАЛО
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F6),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFF1F327D), size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFF1F3F6),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Іздеу...',
                        hintStyle: const TextStyle(color: Colors.black45),
                        isCollapsed: true,
                        // Убираем поведение изменения цвета при фокусе/наведении
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        hoverColor: Colors.transparent, // предотвращает цвет при hover
                        focusColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 32),


          const Icon(Icons.phone_outlined, size: 18, color: Colors.black87),
          const SizedBox(width: 6),
          const Text(
            '+7 (7172) 57-20-75',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(width: 24),
          _CircleIcon(Icons.facebook),

          const SizedBox(width: 32),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.lock_outline, size: 18),
            label: const Text('Жеке кабинет'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1F327D),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(width: 24),


          const _LangSelector(),
        ],
      ),
    );
  }
}

// 🌐 Языковая панель
class _LangSelector extends StatelessWidget {
  const _LangSelector();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Text('KZ', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 4),
          Text('/', style: TextStyle(color: Colors.black45)),
          SizedBox(width: 4),
          Text('EN', style: TextStyle(color: Colors.black54)),
          SizedBox(width: 4),
          Text('/', style: TextStyle(color: Colors.black45)),
          SizedBox(width: 4),
          Text('RU', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

// 👤 Иконка в круге
class _CircleIcon extends StatelessWidget {
  final IconData icon;
  const _CircleIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black26),
        ),
        child: Icon(icon, size: 16, color: Colors.black87),
      ),
    );
  }
}