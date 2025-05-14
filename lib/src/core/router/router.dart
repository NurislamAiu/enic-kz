import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/home_page.dart';



final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    // GoRoute(
    //   path: '/recognition',
    //   builder: (context, state) => const RecognitionPage(),
    // ),
    // GoRoute(
    //   path: '/accreditation',
    //   builder: (context, state) => const AccreditationPage(),
    // ),
    // GoRoute(
    //   path: '/bologna',
    //   builder: (context, state) => const BolognaPage(),
    // ),
    // GoRoute(
    //   path: '/news',
    //   builder: (context, state) => const NewsPage(),
    // ),
    // GoRoute(
    //   path: '/contact',
    //   builder: (context, state) => const ContactPage(),
    // ),
  ],
);