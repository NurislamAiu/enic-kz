import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppNavMenu extends StatelessWidget {
  final String activeTitle;

  const AppNavMenu({super.key, this.activeTitle = 'Басты бет'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: const Color(0xFFF7F7F7),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SidebarItem(
            icon: Icons.home_outlined,
            label: 'Басты бет',
            isActive: activeTitle == 'Басты бет',
          ),
          _SidebarItem(icon: Icons.grid_view, label: 'Орталық туралы'),
          _SidebarItem(icon: Icons.school_outlined, label: 'Болон үдерісі'),
          _SidebarItem(icon: Icons.menu_book_outlined, label: 'Мерзімді басылымдар'),
          _SidebarItem(icon: Icons.insert_drive_file_outlined, label: 'Анықтамалық ақпарат'),
          _SidebarItem(icon: Icons.format_list_bulleted, label: 'ББ реестрі'),
          _SidebarItem(icon: Icons.check_box_outlined, label: 'Қызмет түрлері'),
          _SidebarItem(icon: Icons.help_outline, label: 'Сұрақ-жауап'),
          _SidebarItem(icon: Icons.calendar_today_outlined, label: 'Бос жұмыс орындары'),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _SidebarItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isActive ? Colors.white : Colors.transparent;
    final iconColor = isActive ? Colors.black : Colors.black54;
    final textColor = isActive ? Colors.black : Colors.black87;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
