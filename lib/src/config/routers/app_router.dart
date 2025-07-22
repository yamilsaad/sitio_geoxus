import 'package:get/get.dart';

import 'package:geoxus_web/src/presentation/pages/home_page.dart';

class AppRouter {
  static List<GetPage> get routes => [
        GetPage(name: '/', page: () => const HomePage()),
        //GetPage(name: '/empresa_mobile', page: () => const EmpresaScreen()),
        //GetPage(name: '/ciudadano_mobile', page: () => const CiudadanoScreen()),
        //GetPage(name: '/gobierno_mobile', page: () => const GobiernoScreen()),
      ];
}
