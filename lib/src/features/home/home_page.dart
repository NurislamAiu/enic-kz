import 'package:flutter/material.dart';

import '../../core/widgets/app_nav_menu.dart';
import '../../core/widgets/banner_slider.dart';
import '../../core/widgets/brand_header.dart';
import '../../core/widgets/custom_footer.dart';
import '../../core/widgets/feature_grid_section.dart';
import '../../core/widgets/news_and_events_section.dart';
import '../../core/widgets/partner_logos_section.dart';
import '../../core/widgets/top_control_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              TopControlPanel(),
              BrandHeader(),
              AppNavMenu(),
              BannerSlider(),
              FeatureGridSection(
                items: [
                  {'title': '30 ПБ ББ', 'route': '/30bb'},
                  {'title': 'Жиі қойылатын сұрақтар', 'route': '/faq'},
                  {
                    'title': 'Жоғары білім сапасын ішкі қамтамасыз ету жүйесі: тараптар көзқарасы',
                    'route': '/internal-quality',
                  },
                  {
                    'title': 'Академиялық адалдық – жоғары білім сапасын қамтамасыз ету факторы ретінде',
                    'route': '/academic-integrity',
                  },
                  {
                    'title': 'Болон процесінде Қазақстанның тең төрағалығы',
                    'route': '/bologna-chairmanship',
                  },
                  {'title': 'Ғылыми зерттеулер', 'route': '/research'},
                  {'title': 'Пікірлер', 'route': '/opinions'},
                  {'title': 'Аккредиттеу', 'route': '/accreditation'},
                  {
                    'title': 'Корпоративтік әдеп және сыбайлас жемқорлық тәуекелдеріне қарсы іс-қимыл',
                    'route': '/anti-corruption',
                  },
                  {
                    'title': 'ҚР жоғары оқу орындарындағы қашықтықтан білім берудің үздік тәжірибесі',
                    'route': '/distance-best-practice',
                  },
                  {'title': 'Халықаралық жобалар', 'route': '/international'},
                  {'title': 'Ұлттық біліктілік жүйесі', 'route': '/qualification'},
                  {'title': 'Жоғары білім қолжетімділігі', 'route': '/accessibility'},
                  {'title': 'Шетелдік мамандар', 'route': '/experts'},
                  {'title': 'ЖОО автономиясын кеңейту', 'route': '/autonomy'},
                  {
                    'title': 'Жоғары және жоғары оқу орнынан кейінгі білім беру бағдарламаларының тізілімі',
                    'route': '/program-list',
                  },
                ],
              ),
              NewsAndEventsSection(),
              PartnerLogoCarousel(
                logoPaths: [
                  'assets/image/partner.png',
                  'assets/image/partner1.jpg',
                  'assets/image/partner2.png',
                  'assets/image/partner.png',
                  'assets/image/partner1.jpg',
                  'assets/image/partner2.png',
                ],

              ),
              CustomFooter()
            ],
          ),
        ),
    );
  }
}
