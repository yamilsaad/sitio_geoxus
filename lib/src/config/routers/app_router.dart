import 'package:geoxus_web/src/presentation/pages/home_page.dart';
import 'package:get/get.dart';

class AppRouter {
  static List<GetPage> get routes => [
        GetPage(name: '/', page: () => const HomePage()),
      ];
}
