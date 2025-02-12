import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TecnologiaMobileView extends StatefulWidget {
  const TecnologiaMobileView({super.key});

  @override
  State<TecnologiaMobileView> createState() => _TecnologiaMobileViewState();
}

class _TecnologiaMobileViewState extends State<TecnologiaMobileView> {
  bool _isVisible = false;
  final List<Map<String, String>> tech = const [
    {
      'nombre': 'Geoxus Survey',
      'descripcion':
          'Una Aplicación Móvil desarrollada con tecnología multiplataforma de punta. Intuitiva y veloz, te permite relevar eventos en tiempo real marcando tu posición geográfica con excepcional presición.',
      'imagen': 'assets/img/logo/logo_survey.png'
    },
    {
      'nombre': 'Geoxus Admin',
      'descripcion':
          'Así como Geoxus App, Geoxus Admin agiliza la respuesta de tus colaboradores ante cualquier evento relevado.',
      'imagen': 'assets/img/logo/icon_geox.png'
    },
    {
      'nombre': 'Geoxus Monitoring',
      'descripcion':
          'Geoxus Monitoring es tu centro de mando y monitoreo. Una Aplicación Web con un mapa integrado en tiempo real donde podrás monitorear cada evento relevado.',
      'imagen': 'assets/img/logo/logo_monitoring.png'
    },
    {
      'nombre': 'Nuestra Tecnología',
      'descripcion':
          'Geoxus está compuesto por tecnología de vanguardia respaldada por grandes empresas como Google y Firebase.',
      'imagen': 'assets/img/logo/ecosistema.png'
    },
  ];

  void showAlert(BuildContext context, Map<String, String> guia) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(guia['nombre'] ?? 'Sin nombre'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (guia['imagen'] != null)
              Image.asset(
                guia['imagen']!,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 10),
            Text(guia['descripcion'] ?? 'Sin descripción'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return VisibilityDetector(
      key: Key('tech_mobile'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: _isVisible
          ? SizedBox(
              height: _screenHeight * 1,
              width: _screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: _screenHeight * 0.07),
                    FadeIn(
                      duration: Duration(milliseconds: 1500),
                      child: Text(
                        'Un Software poderoso e integral',
                        style: TextStyle(
                          fontSize: _screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: _screenHeight * 0.025),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1700),
                      child: Column(
                        children: tech.map((guia) {
                          return GestureDetector(
                            onTap: () => showAlert(context, guia),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: _screenWidth * 0.25,
                                    height: _screenHeight * 0.14,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        guia['imagen'] ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: _screenWidth * 0.05),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          guia['nombre'] ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: _screenWidth * 0.04,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Ver más...',
                                          style: TextStyle(
                                            fontSize: _screenWidth * 0.035,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: _screenHeight * 0.075,
              width: _screenWidth * 0.075,
            ),
    );
  }
}
