import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:geoxus_web/firebase_options.dart';
import 'package:geoxus_web/src/config/routers/app_router.dart';
import 'package:geoxus_web/src/data/providers/theme_provider.dart';
import 'package:geoxus_web/src/data/shared/share_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init(); // Inicializar SharedPreferences
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Get.put(VideoController()); //Controller para mostrar video del storage

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemesProvider(),
      child: Consumer<ThemesProvider>(
        builder: (context, themesProvider, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Geoxus Web',
            initialRoute: '/',
            getPages: AppRouter.routes,
            theme: themesProvider.currentTheme,
          );
        },
      ),
    );
  }
}
