import 'dart:async';
import 'package:flutter/material.dart';


class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> banners = [
    {
      "date": "26.03.2025",
      "views": "881",
      "title": "«БББ Тізілімі» ақпараттық жүйесіне өтінімдерді қабылдау",
      "description": "Жоғары білім беруді дамытудың ұлттық орталығы ...",
    },
    {
      "date": "26.03.2025",
      "views": "881",
      "title": "«БББ Тізілімі» ақпараттық жүйесіне өтінімдерді қабылдау",
      "description": "Жоғары білім беруді дамытудың ұлттық орталығы ...",
    },
    {
      "date": "26.03.2025",
      "views": "881",
      "title": "«БББ Тізілімі» ақпараттық жүйесіне өтінімдерді қабылдау",
      "description": "Жоғары білім беруді дамытудың ұлттық орталығы ...",
    },
    {
      "date": "26.03.2025",
      "views": "881",
      "title": "«БББ Тізілімі» ақпараттық жүйесіне өтінімдерді қабылдау",
      "description": "Жоғары білім беруді дамытудың ұлттық орталығы ...",
    },
    {
      "date": "13.05.2025",
      "views": "8",
      "title": "Қазақстан мен Италия ынтымақтастығын нығайтады",
      "description": "Цифрлық трансформация және біліктілікті тану ...",
    },
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) return;
      final next = (_currentIndex + 1) % banners.length;
      _controller.animateToPage(next, duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0288D1), Color(0xFF01579B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                final b = banners[index];
                final isCurrent = index == _currentIndex;

                return Padding(
                  padding: const EdgeInsets.all(28),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedSlide(
                      offset: isCurrent ? Offset(0, 0) : const Offset(0.5, 0),
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                      child: AnimatedOpacity(
                        opacity: isCurrent ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 400),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(b['date']!, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.remove_red_eye, color: Colors.white70, size: 16),
                                  const SizedBox(width: 4),
                                  Text(b['views']!, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Text(
                                b['title']!,
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                b['description']!,
                                style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.5),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward, size: 18),
                                label: const Text("Толығырақ"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF01579B),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),

          Positioned(
            bottom: 16,
            right: 28,
            child: Row(
              children: List.generate(banners.length, (index) {
                final isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: isActive ? 12 : 8,
                  height: isActive ? 12 : 8,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Colors.white54,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}