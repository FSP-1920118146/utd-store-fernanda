import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';


void main() async {

  WidgetsFlutterBinding
      .ensureInitialized();

  await initDependencies(
    webMode: kIsWeb,
  );

  runApp(
    const MyApp(),
  );
}


class MyApp
    extends StatelessWidget {

  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {

    return MaterialApp.router(

      debugShowCheckedModeBanner:
          false,


      theme: ThemeData(

        scaffoldBackgroundColor:
            const Color(
          0xFFF8F7F3,
        ),


        colorScheme:
            ColorScheme.fromSeed(

          seedColor:
              const Color(
            0xFF8FAF9D,
          ),
        ),


        appBarTheme:
            const AppBarTheme(

          backgroundColor:
              Color(
            0xFF8FAF9D,
          ),

          foregroundColor:
              Colors.white,

          centerTitle:
              true,
        ),


        cardTheme:
            const CardThemeData(

        elevation: 3,
),
      ),


      routerConfig:
          appRouter,
    );
  }
}