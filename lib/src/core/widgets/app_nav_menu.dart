import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final Map<String, String> navRoutes = {
  // Орталық туралы
  'Орталықтың тарихы': '/about/history',
  'Стратегиясы және міндеті': '/about/strategy',
  'Басшылық құрам': '/about/team',
  'Құрылымы': '/about/structure',
  'Орталықтың Меморандумдары': '/about/memos',
  'Іс-шара': '/about/events',
  'Қоғамдық өмір': '/about/community',

  // Болон процесі
  'Болон процесі тарихы': '/bologna/history',
  'Қазақстан Болон процесінде': '/bologna/kz',
  'Төрағалар': '/bologna/chairs',
  'Болон процесі қалай жұмыс істейді?': '/bologna/how',
  'Негізгі құжаттар': '/bologna/docs',
  'ESG & ECTS': '/bologna/esg',
  'ЕКБҚ құралдары': '/bologna/tools',
  'UNESCO': '/bologna/unesco',
  'Аналитикалық есептер': '/bologna/reports',
  'Күміс білім беру курстарын жүзеге асыратын университет тізімі': '/bologna/silver',

  // Мерзімді басылымдар
  'Журнал "Қазақстанның жоғары мектебі"': '/media/journal',
  'Дайджесты': '/media/digest',

  // Анықтамалық ақпарат
  'Жоғары білім беруді дамыту ұлттық орталығы материалдары': '/info/materials',
  'Қазақстандағы жоғары оқу жүйесі': '/info/system',
  'ҚР ЖОО-ның диплом үлгілері': '/info/diplomas',
  'Қазақстанның ЖОО': '/info/universities',

  // ББ Тізілімі
  'НҚА': '/registry/nka',
  'ЖЖОКБҰ': '/registry/zhzhokbu',
  'ББ сарапшысына': '/registry/expert',
  'ББ тізілімінің семинар-тренингтері': '/registry/trainings',

  // Қызметі
  'Ұлттық баяндама': '/services/report',
  'Жоғары білім мазмұны': '/services/content',
  'Академиялық ұтқырлық': '/services/mobility',
  'Білім туралы құжаттарды тану': '/services/recognition',
  'Ғылыми зерттеулер': '/services/research',
  'Жобалық офисі': '/services/office',
  'Жоғары білім саласындағы халықаралық ынтымақтастық': '/services/international',
  '«Мамандығым–болашағым» бағдарламасы': '/services/program',
  'Өңірлік картасы': '/services/map',

  // Простые
  'Сұрақ-жауап': '/faq',
  'Бос орындар': '/vacancies',
};

class AppNavMenu extends StatelessWidget {
  const AppNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDFDFD),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            _NavItem(
              title: 'Орталық туралы',
              submenu: [
                'Орталықтың тарихы',
                'Стратегиясы және міндеті',
                'Басшылық құрам',
                'Құрылымы',
                'Орталықтың Меморандумдары',
                'Іс-шара',
                'Қоғамдық өмір',
              ],
            ),
            _NavItem(
              title: 'Болон процесі',
              submenu: [
                'Болон процесі тарихы',
                'Қазақстан Болон процесінде',
                'Төрағалар',
                'Болон процесі қалай жұмыс істейді?',
                'Негізгі құжаттар',
                'ESG & ECTS',
                'ЕКБҚ құралдары',
                'UNESCO',
                'Аналитикалық есептер',
                'Күміс білім беру курстарын жүзеге асыратын университет тізімі',
              ],
            ),
            _NavItem(
              title: 'Мерзімді басылымдар',
              submenu: [
                'Журнал "Қазақстанның жоғары мектебі"',
                'Дайджесты',
              ],
            ),
            _NavItem(
              title: 'Анықтамалық ақпарат',
              submenu: [
                'Жоғары білім беруді дамыту ұлттық орталығы материалдары',
                'Қазақстандағы жоғары оқу жүйесі',
                'ҚР ЖОО-ның диплом үлгілері',
                'Қазақстанның ЖОО',
              ],
            ),
            _NavItem(
              title: 'ББ Тізілімі',
              submenu: [
                'НҚА',
                'ЖЖОКБҰ',
                'ББ сарапшысына',
                'ББ тізілімінің семинар-тренингтері',
              ],
            ),
            _NavItem(
              title: 'Қызметі',
              submenu: [
                'Ұлттық баяндама',
                'Жоғары білім мазмұны',
                'Академиялық ұтқырлық',
                'Білім туралы құжаттарды тану',
                'Ғылыми зерттеулер',
                'Жобалық офисі',
                'Жоғары білім саласындағы халықаралық ынтымақтастық',
                '«Мамандығым–болашағым» бағдарламасы',
                'Өңірлік картасы',
              ],
            ),
            _NavItem(title: 'Сұрақ-жауап'),
            _NavItem(title: 'Бос орындар'),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final List<String>? submenu;

  const _NavItem({required this.title, this.submenu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: submenu != null
          ? PopupMenuButton<String>(
        tooltip: '',
        position: PopupMenuPosition.under,
        offset: const Offset(0, 10),
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        itemBuilder: (context) => submenu!
            .map((item) => PopupMenuItem<String>(
          value: item,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SizedBox(
            width: 320,
            child: Text(
              item,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ))
            .toList(),
        onSelected: (val) {
          final route = navRoutes[val];
          if (route != null) {
            GoRouter.of(context).go(route);
          }
        },
        child: _StyledNavButton(
          label: title,
          hasArrow: true,
        ),
      )
          : _StyledNavButton(
        label: title,
        onTap: () {
          final route = navRoutes[title];
          if (route != null) {
            Navigator.pushNamed(context, route);
          }
        },
      ),
    );
  }
}

class _StyledNavButton extends StatelessWidget {
  final String label;
  final bool hasArrow;
  final VoidCallback? onTap;

  const _StyledNavButton({
    required this.label,
    this.hasArrow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      hoverColor: Colors.grey.shade100,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            if (hasArrow) ...[
              const SizedBox(width: 6),
              const Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: Colors.black54),
            ]
          ],
        ),
      ),
    );
  }
}