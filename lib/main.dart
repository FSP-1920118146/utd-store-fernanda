import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies(
    webMode: kIsWeb,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {

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

      routerConfig:
          appRouter,
    );
  }
}