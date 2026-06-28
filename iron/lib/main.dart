import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/iron_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  

  configureDependencies();
  
  runApp(const IronApp());
}

class IronApp extends StatelessWidget {
  const IronApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IRON',
      theme: IronTheme.darkTheme, // We only have dark theme per spec
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
