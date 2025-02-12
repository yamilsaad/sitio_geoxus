import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class AvatarSelectionWidget extends StatefulWidget {
  const AvatarSelectionWidget(
      {super.key, required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;

  @override
  State<AvatarSelectionWidget> createState() => _AvatarSelectionWidgetState();
}

class _AvatarSelectionWidgetState extends State<AvatarSelectionWidget> {
  bool isHoveredEmpresa = false;
  bool isHoveredGobierno = false;
  bool isHoveredCiudadano = false;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
      child: SizedBox(
        width: widget.screenWidth,
        height: widget.screenHeight * 0.25,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: widget.screenWidth * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        Text(
                          'Geoxus permite reportar eventos geográficos de tipo y naturaleza geológica, biológica, ecológica climática y social. Optimiza los procesos de abordaje y resolución de todo tipos de eventos en tu organización.',
                          style:
                              TextStyle(fontSize: widget.screenWidth * 0.012),
                        ),
                        Divider(
                          height: widget.screenHeight * 0.06,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: widget.screenWidth * 0.05),
                _buildCard(
                  title: 'Empresa',
                  icon: FontAwesomeIcons.building,
                  isHovered: isHoveredEmpresa,
                  onHover: (hovering) =>
                      setState(() => isHoveredEmpresa = hovering),
                  details: [
                    'Logística y Supply Chain.',
                    'Monitoreo de activos.',
                    'Saber más...',
                  ],
                ),
                SizedBox(width: widget.screenWidth * 0.05),
                _buildCard(
                  title: 'Gobierno',
                  icon: FontAwesomeIcons.buildingColumns,
                  isHovered: isHoveredGobierno,
                  onHover: (hovering) =>
                      setState(() => isHoveredGobierno = hovering),
                  details: [
                    'Planificación urbana.',
                    'Medioambiente. Emergecnias',
                    'Saber más...',
                  ],
                ),
                SizedBox(width: widget.screenWidth * 0.05),
                _buildCard(
                  title: 'Ciudadano',
                  icon: FontAwesomeIcons.users,
                  isHovered: isHoveredCiudadano,
                  onHover: (hovering) =>
                      setState(() => isHoveredCiudadano = hovering),
                  details: [
                    'Reporte de incidentes locales.',
                    'Participación comunitaria.',
                    'Saber más...',
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required bool isHovered,
    required Function(bool) onHover,
    required List<String> details,
  }) {
    return GestureDetector(
      onTap: () {
        // Acción al hacer clic
      },
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isHovered ? Colors.grey[200] : Colors.black,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: isHovered ? 10 : 5,
                offset: Offset(0, isHovered ? 4 : 2),
              ),
            ],
          ),
          child: SizedBox(
            height: widget.screenHeight * 0.22,
            width: widget.screenWidth * 0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.015,
                          color: isHovered ? Colors.black : Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: widget.screenWidth * 0.01),
                      CircleAvatar(
                        radius: widget.screenWidth * 0.015,
                        child: FaIcon(
                          icon,
                          size: widget.screenWidth * 0.015,
                          color: isHovered ? Colors.black : Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: details
                        .map((detail) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                detail,
                                style: TextStyle(
                                  fontSize: widget.screenWidth * 0.01,
                                  color: isHovered
                                      ? Colors.black
                                      : Colors.grey[200],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
