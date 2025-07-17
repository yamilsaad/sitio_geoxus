import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/app_theme.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';

class InicioWebView extends StatelessWidget {
  const InicioWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.width,
      height: responsive.height,
      color: AppColors.dark,
      child: Column(
        children: [
          // Header: logo + botón contacto
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Logo
                /*Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Image.asset(
                    'assets/img/logo/logo_geoxus1.webp',
                    height: responsive.width * 0.12,
                  ),
                ),*/
                // Botón de contacto
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Contacto',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          // Hero Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: responsive.isMobile ? 16.0 : 64.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Texto principal
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: responsive.isMobile ? 28 : 44,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                            children: const [
                              TextSpan(text: 'GEOXUS '),
                              TextSpan(
                                  text: 'Product',
                                  style: TextStyle(color: AppColors.primary)),
                              TextSpan(text: ' is\n'),
                              TextSpan(text: 'built by great '),
                              TextSpan(
                                  text: 'teams',
                                  style: TextStyle(color: AppColors.primary)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'We help build and manage a team of world-class developers\nto bring your vision to life',
                          style: TextStyle(
                            fontSize: responsive.isMobile ? 16 : 22,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("¡Quiero GEOXUS!",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  // Ilustración
                  if (!responsive.isMobile)
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Image.asset(
                          'assets/img/logo/imagen_inicio.webp', // Ilustración del hero section
                          height: responsive.height * 0.75,
                          width: responsive.width * 0.75,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
