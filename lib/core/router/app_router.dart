import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text("Home Page"),
        ),
      ),
    ),
  ],
);