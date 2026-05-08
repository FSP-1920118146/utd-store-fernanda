import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

import '../../features/products/presentation/pages/product_page.dart';

import '../../features/crypto/presentation/pages/crypto_page.dart';

import '../../features/isolate/presentation/pages/isolate_page.dart';

import '../../features/battery/presentation/pages/battery_page.dart';


final appRouter = GoRouter(

  routes: [

    GoRoute(

      path: '/',

      builder: (
        context,
        state,
      ) =>
          const SplashPage(),
    ),


    GoRoute(

      path: '/home',

      builder: (
        context,
        state,
      ) =>
          const ProductPage(),
    ),


    GoRoute(

      path: '/crypto',

      builder: (
        context,
        state,
      ) =>
          const CryptoPage(),
    ),


    GoRoute(

      path: '/isolate',

      builder: (
        context,
        state,
      ) =>
          const IsolatePage(),
    ),


    GoRoute(

      path: '/battery',

      builder: (
        context,
        state,
      ) =>
          const BatteryPage(),
    ),
  ],
);