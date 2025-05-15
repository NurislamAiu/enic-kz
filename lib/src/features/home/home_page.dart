import 'package:enic_kz_web/src/features/home/presentation/widgets/banner_slider.dart';
import 'package:enic_kz_web/src/features/home/presentation/widgets/feature_grid_section.dart';
import 'package:enic_kz_web/src/features/home/presentation/widgets/news_and_events_section.dart';
import 'package:enic_kz_web/src/features/home/presentation/widgets/partner_logos_section.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app_nav_menu.dart';
import '../../core/widgets/custom_footer.dart';
import '../../core/widgets/top_control_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopControlPanel(),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const AppNavMenu(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 24, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BannerSlider(),

                        const SizedBox(height: 24),

                        FeatureGridSection(
                          items: [
                            {
                              'title': 'Академиялық адалдық — жоғары білім сапасының кепілі',
                              'route': '/honesty',
                            },
                            {
                              'title': 'Жиі қойылатын сұрақтар',
                              'route': '/faq',
                            },
                            {
                              'title': 'Ғылыми зерттеулер',
                              'route': '/research',
                            },
                            {
                              'title': 'ҚР ЖОО-ларындағы қашықтан оқыту тәжірибелері',
                              'route': '/best-practices',
                            },
                          ],
                        ),
                        NewsAndEventsSection(),

                        const SizedBox(height: 32),
                        const PartnerLogoCarousel(
                          logoPaths: [
                            'assets/image/partner.png',
                            'assets/image/partner1.jpg',
                            'assets/image/partner2.png',
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
          ),
        ],
      ),
    );
  }
}