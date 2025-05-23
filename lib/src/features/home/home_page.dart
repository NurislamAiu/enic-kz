import 'package:flutter/material.dart';
import 'package:enic_kz_web/src/features/home/presentation/widgets/banner_slider.dart';
import 'package:enic_kz_web/src/features/home/presentation/widgets/feature_grid_section.dart';
import 'package:enic_kz_web/src/features/home/presentation/widgets/news_and_events_section.dart';
import 'package:enic_kz_web/src/features/home/presentation/widgets/partner_logos_section.dart';
import '../../core/widgets/custom_footer.dart';
import '../../core/widgets/top_control_panel.dart';
import '../../core/widgets/app_nav_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  bool _isMenuVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _toggleMenu() {
    if (_controller.status == AnimationStatus.dismissed) {
      setState(() => _isMenuVisible = true);
      _controller.forward();
    } else {
      _controller.reverse().then((_) {
        if (mounted) {
          setState(() => _isMenuVisible = false);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Основной контент
          Column(
            children: [
              TopControlPanel(
                selectedLanguage: 'RU',
                onLanguageChanged: (lang) {
                  print("Выбран язык: $lang");

                },
                trailing: IconButton(onPressed: _toggleMenu, icon: Icon(Icons.menu))
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BannerSlider(),
                      const SizedBox(height: 24),
                      FeatureGridSection(
                        items: [
                          {'title': 'Академиялық адалдық', 'route': '/honesty'},
                          {'title': 'Жиі қойылатын сұрақтар', 'route': '/faq'},
                          {'title': 'Ғылыми зерттеулер', 'route': '/research'},
                          {
                            'title': 'ҚР ЖОО-ларындағы тәжірибелер',
                            'route': '/best-practices',
                          },
                        ],
                      ),
                      const NewsAndEventsSection(),
                      const SizedBox(height: 32),
                      const PartnerLogoCarousel(
                        logoPaths: [
                          'assets/image/partner.png',
                          'assets/image/partner1.jpg',
                          'assets/image/partner2.png',
                        ],
                      ),
                      const SizedBox(height: 32),
                      const CustomFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          IgnorePointer(
            ignoring: !_isMenuVisible,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _controller.value,
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: child,
                  ),
                );
              },
              child: Material(
                color: Colors.white.withOpacity(0.97),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: IconButton(
                          icon: const Icon(Icons.close, size: 28),
                          onPressed: _toggleMenu,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AppNavMenu(
                        key: ValueKey(_isMenuVisible),
                        onItemSelected: _toggleMenu,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
