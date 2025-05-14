import 'package:flutter/material.dart';

class BrandHeader extends StatefulWidget {
  const BrandHeader({super.key});

  @override
  State<BrandHeader> createState() => _BrandHeaderState();
}

class _BrandHeaderState extends State<BrandHeader> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    
    precacheImage(const AssetImage('assets/image/kz.png'), context);
    precacheImage(const AssetImage('assets/image/bolona.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Image.asset(
            'assets/image/kz.png',
            height: 90,
            fit: BoxFit.contain,
          ),

          
          Column(
            children: const [
              Text(
                "ENIC-KAZAKHSTAN",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF276FC2),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "ЖОҒАРЫ БІЛІМ БЕРУДІ ДАМЫТУ ҰЛТТЫҚ ОРТАЛЫҒЫ",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF276FC2),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          
          Image.asset(
            'assets/image/bolona.png',
            height: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}