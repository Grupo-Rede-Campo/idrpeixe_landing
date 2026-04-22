import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/core/utils/url_helpers.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      color: Colors.black87,
      child: MaxWidthContainer(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 10,
            left: isMobile ? 24 : 80,
            right: isMobile ? 24 : 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Contato",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _ContactItem(
                icon: Icons.email,
                label: "suportevendomeupeixe@idr.pr.gov.br",
                onTap: () => UrlHelpers.openEmail('suportevendomeupeixe@idr.pr.gov.br', subject: 'Contato IDR Peixe'),
              ),
              const SizedBox(height: 12),
              _ContactItem(
                icon: Icons.phone,
                label: "(45) 9902-1184",
                onTap: () => UrlHelpers.openPhone('+554599021184'),
              ),
              const SizedBox(height: 12),
              _ContactItem(
                icon: FontAwesomeIcons.whatsapp,
                label: "WhatsApp",
                onTap: () => UrlHelpers.openWhatsApp('554599021184'),
              ),
              const SizedBox(height: 24),
              const Text(
                "Redes Sociais",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _SocialButton(
                    icon: FontAwesomeIcons.facebook,
                    label: 'Facebook',
                    onTap: () => UrlHelpers.openFacebook('idrparana'),
                  ),
                  const SizedBox(width: 12),
                  _SocialButton(
                    icon: FontAwesomeIcons.instagram,
                    label: 'Instagram',
                    onTap: () => UrlHelpers.openInstagram('rede.campo'),
                  ),
                  const SizedBox(width: 12),
                  _SocialButton(
                    icon: FontAwesomeIcons.youtube,
                    label: 'YouTube',
                    onTap: () => UrlHelpers.openYouTube('@redecampo?si=vV7mxRuiNmctLlGg'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "© 2026 - IDR Peixe",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Todos os direitos reservados",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              color: _isHovering ? Colors.blue.shade300 : Colors.white70,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: TextStyle(
                color: _isHovering ? Colors.blue.shade300 : Colors.white70,
                fontSize: 16,
                decoration: _isHovering ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.label,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isHovering ? Colors.blue.shade600 : Colors.white24,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
