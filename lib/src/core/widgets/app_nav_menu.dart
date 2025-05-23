import 'package:flutter/material.dart';

class AppNavMenu extends StatefulWidget {
  final VoidCallback? onItemSelected;
  const AppNavMenu({super.key, this.onItemSelected});

  @override
  State<AppNavMenu> createState() => _AppNavMenuState();
}

class _AppNavMenuState extends State<AppNavMenu> {
  String? expandedMenu;
  int? hoveredIndex;

  static const Color brandColor = Color(0xFF1F327D);

  final List<_NavItem> menuItems = const [
    _NavItem('Орталық туралы', Icons.info_outline),
    _NavItem('Болон процесі', Icons.school_outlined),
    _NavItem('Мерзімді басылымдар', Icons.menu_book_outlined),
    _NavItem('Анықтамалық ақпарат', Icons.insert_drive_file_outlined),
    _NavItem('ББ Тізілімі', Icons.format_list_bulleted),
    _NavItem('Қызметі', Icons.check_box_outlined),
    _NavItem('Сұрақ-жауап', Icons.help_outline),
    _NavItem('Бос орындар', Icons.work_outline),
  ];

  final Map<String, List<String>> subMenus = const {
    'Орталық туралы': [
      'Орталықтың тарихы',
      'Стратегиясы және міндеті',
      'Басшылық құрам',
      'Құрылымы',
      'Орталықтың Меморандумдары',
      'Іс-шара',
      'Қоғамдық өмір',
    ],
    'Болон процесі': [
      'Процесс кезеңдері',
      'ЕУ стандарттары',
      'Жоғары білім рейтингтері',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white.withOpacity(0.3),
            child: Column(
              children: [
                // Logo/Title
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
                  child: Row(
                    children: [
                      // Image.asset('assets/logo.png', height: 40),
                      const Text(
                        'ENIC-KZ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // Search
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: const Icon(Icons.search, color: brandColor),
                      hintText: 'Іздеу...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: brandColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (q) {},
                  ),
                ),
                const SizedBox(height: 20),
                // Menu items
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: menuItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 4),
                    itemBuilder: (context, i) {
                      final item = menuItems[i];
                      final isSelected = expandedMenu == item.title;
                      final isHovered = hoveredIndex == i;
                      return MouseRegion(
                        onEnter: (_) => setState(() => hoveredIndex = i),
                        onExit: (_) => setState(() => hoveredIndex = null),
                        child: GestureDetector(
                          onTap: () => setState(() => expandedMenu = item.title),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: isHovered
                                  ? brandColor.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(item.icon,
                                    color: isSelected
                                        ? brandColor
                                        : Colors.grey[600]),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.w500,
                                          color: isSelected
                                              ? brandColor
                                              : Colors.grey[800],
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 250),
                                        height: 2,
                                        width: isHovered ? 60 : 0,
                                        margin: const EdgeInsets.only(top: 6),
                                        decoration: BoxDecoration(
                                          color: brandColor,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  Icon(Icons.arrow_right, color: brandColor)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
                // Social icons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Row(
                    children: const [
                      Icon(Icons.facebook, size: 20, color: brandColor),
                      SizedBox(width: 12),
                      Icon(Icons.facebook, size: 20, color: brandColor),
                      SizedBox(width: 12),
                      Icon(Icons.facebook, size: 20, color: brandColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Submenu Panel with scrolling
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
              child: expandedMenu != null && subMenus.containsKey(expandedMenu)
                  ? SingleChildScrollView(
                key: ValueKey(expandedMenu),
                padding: const EdgeInsets.all(48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expandedMenu!,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Тереңірек ақпарат алу үшін бөлім таңдаңыз.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 32),
                    ...subMenus[expandedMenu]!
                        .map((link) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                      title: Text(
                        link,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: brandColor),
                      onTap: widget.onItemSelected,
                    ))
                        .toList(),
                  ],
                ),
              )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}

class _NavItem {
  final String title;
  final IconData icon;
  const _NavItem(this.title, this.icon);
}