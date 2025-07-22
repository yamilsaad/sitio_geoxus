import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterWebView extends StatelessWidget {
  const FooterWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 16.0 : 64.0,
        vertical: 32.0,
      ),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo o nombre
          Text(
            'GEOXUS',
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.isMobile ? 20 : 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),

          // Links
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _FooterLink('Inicio', onTap: () {}),
              _FooterLink('Servicios', onTap: () {}),
              _FooterLink('Contacto', onTap: () {}),
              _FooterLink('Términos y Condiciones', onTap: () {}),
              _FooterLink('Política de Privacidad', onTap: () {}),
            ],
          ),
          const SizedBox(height: 32),

          // Íconos sociales
          Row(
            children: [
              _SocialIconButton(
                icon: FontAwesomeIcons.instagram,
                onTap: () {
                  // TODO: reemplazá con tu enlace real
                },
              ),
              const SizedBox(width: 16),
              _SocialIconButton(
                icon: FontAwesomeIcons.linkedin,
                onTap: () {
                  // TODO: reemplazá con tu enlace real
                },
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Línea divisoria
          Divider(color: Colors.white24),

          // Copyright
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              '© ${DateTime.now().year} GEOXUS. Todos los derechos reservados.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: responsive.isMobile ? 12 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink(this.text, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white10,
      hoverColor: Colors.white12,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.white12,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(8),
        ),
        child: FaIcon(
          icon,
          color: Colors.white70,
          size: 20,
        ),
      ),
    );
  }
}
