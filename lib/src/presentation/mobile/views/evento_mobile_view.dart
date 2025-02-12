import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:geoxus_web/src/core/components/component.dart';

class EventoMobileView extends StatefulWidget {
  const EventoMobileView({super.key});

  @override
  State<EventoMobileView> createState() => _EventoMobileViewState();
}

class _EventoMobileViewState extends State<EventoMobileView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isVisible = false; // Variable para controlar la animación

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return VisibilityDetector(
      key: Key('evento-mobile-view'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
            _animationController
                .forward(); // Inicia la animación solo si es visible
          });
        }
      },
      child: SizedBox(
        height: _screenHeight * 1,
        width: _screenWidth * 2,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: _screenWidth * 1,
                height: _screenHeight * 1,
                child: Image.asset(
                  'assets/img/hard/sostenible.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.black54,
              width: _screenWidth,
              height: _screenHeight,
            ),
            _isVisible
                ? FadeIn(
                    duration: const Duration(milliseconds: 1000),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        width: _screenWidth * 0.75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '¿Qué es un evento?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: _screenWidth * 0.08),
                            ),
                            SizedBox(height: _screenHeight * 0.03),
                            Text(
                              'Un evento es un hecho imprevisto o programado que ocurre en la superficie terrestre, sea en un ambiente natural, rural o urbano. Geoxus permite registar manualmente cualquier tipo de evento geográfico en multiples formatos. Además, almacena y ordena la información para aplicar la estadística adecuada. GEOXUS releva en tiempo real.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: _screenWidth * 0.05),
                            ),
                            SizedBox(height: _screenHeight * 0.03),
                            QuieroGeoxusMobileComponent(
                                screenWidth: _screenWidth,
                                screenHeight: _screenHeight,
                                textTitle: 'PROBAR GEOXUS')
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    // Espacio vacío para evitar reacomodos
                    height: _screenHeight * 0.075,
                    width: _screenWidth * 0.075,
                  ),
          ],
        ),
      ),
    );
  }
}
