import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TextAvatarWidget extends StatefulWidget {
  const TextAvatarWidget({super.key});

  @override
  State<TextAvatarWidget> createState() => _TextAvatarWidgetState();
}

class _TextAvatarWidgetState extends State<TextAvatarWidget> {
  bool _isVisible = false; // Para controlar la animación
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

    return VisibilityDetector(
      key: Key('text_uno'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          // Detecta si al menos el 20% es visible
          setState(() {
            _isVisible = true; // Activa la animación
          });
        }
      },
      child: _isVisible
          ? FadeIn(
              duration: Duration(milliseconds: 1200),
              child: SizedBox(
                width: _screenWidth * 0.8,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: _screenHeight * 0.02,
                      ),
                      Text(
                        'Geoxus permite reportar eventos geográficos de tipo y naturaleza geológica, biológica, ecológica climática y social. Optimiza los procesos de abordaje y resolución de todo tipos de eventos en tu organización.',
                        style: TextStyle(fontSize: _screenWidth * 0.05),
                      ),
                      Divider(
                        height: _screenHeight * 0.06,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SizedBox(
              // Espacio vacío para evitar reacomodos
              height: _screenHeight * 0.075,
              width: _screenWidth * 0.075,
            ),
    );
  }
}
