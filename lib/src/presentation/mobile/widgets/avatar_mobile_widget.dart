import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AvatarMobileWidget extends StatefulWidget {
  const AvatarMobileWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<AvatarMobileWidget> createState() => _AvatarMobileWidgetState();
}

class _AvatarMobileWidgetState extends State<AvatarMobileWidget> {
  bool _isVisible = false; // Para controlar la animación
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return VisibilityDetector(
      key: Key('avatar-mobile'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          // Detecta si al menos el 20% es visible
          setState(() {
            _isVisible = true; // Activa la animación
          });
        }
      },
      child: _isVisible
          ? FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: SizedBox(
                //color: Colors.red,
                width: widget.screenWidth,
                height: widget.screenHeight * 0.75,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildCard(
                          context,
                          title: 'Empresa',
                          icon: FontAwesomeIcons.building,
                          details: [
                            'Logística y Supply Chain.',
                            'Monitoreo de activos.',
                            'Gestion y asignación de tareas.',
                            'Saber más...'
                          ],
                        ),
                        SizedBox(height: widget.screenHeight * 0.025),
                        _buildCard(
                          context,
                          title: 'Gobierno',
                          icon: FontAwesomeIcons.buildingColumns,
                          details: [
                            'Planificación urbana.',
                            'Medioambiente. Abordaje de Emergencias en tiempo real.',
                            'Saber más...'
                          ],
                        ),
                        SizedBox(height: widget.screenHeight * 0.025),
                        _buildCard(
                          context,
                          title: 'Ciudadano',
                          icon: FontAwesomeIcons.users,
                          details: [
                            'Reporte de incidentes locales.',
                            'Participación comunitaria.',
                            'Desarrollo sostenible',
                            'Saber más...'
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          : Container(
              // Espacio vacío para evitar reacomodos
              height: _screenHeight * 0.075,
              width: _screenWidth * 0.075,
            ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<String> details,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: widget.screenHeight * 0.22,
        width: widget.screenWidth * 0.8,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: widget.screenWidth * 0.05,
                        child: FaIcon(icon, size: widget.screenWidth * 0.04),
                      ),
                      SizedBox(width: widget.screenWidth * 0.025),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...details.map((detail) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          detail,
                          style: TextStyle(fontSize: widget.screenWidth * 0.04),
                        ),
                      )),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                heroTag: title,
                mini: true,
                onPressed: () {
                  switch (title) {
                    case 'Empresa':
                      Get.toNamed('/empresa_mobile');
                      break;
                    case 'Gobierno':
                      Get.toNamed('/gobierno_mobile');
                      break;
                    case 'Ciudadano':
                      Get.toNamed('/ciudadano_mobile');
                      break;
                  }
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String title;

  const DetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de $title'),
      ),
      body: Center(
        child: Text(
          'Información detallada sobre $title',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
