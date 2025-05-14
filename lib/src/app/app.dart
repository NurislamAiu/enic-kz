import 'package:flutter/material.dart';

import '../core/router/router.dart';
import '../core/theme/theme.dart';

class ENICKazakhstanApp extends StatelessWidget {
  const ENICKazakhstanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ENIC Kazakhstan',
      theme: lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}