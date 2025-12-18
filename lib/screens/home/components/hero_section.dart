import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0184FF), Color(0xFF00C7A2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: MaxWidthContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 24 : 80,
            vertical: screenWidth < 600 ? 50 : 80,
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "IDR Peixe",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Bons Negócios, Praticidade e Confiança!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Baixe já o APP e faça suas vendas a um bom preço, com confiança "
                      "e sem precisar sair de casa.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Versão 2.0.0+9 • Dezembro 2025',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    const SizedBox(height: 30),
                    _downloadButtons(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TEXTOS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "IDR Peixe",
                          style: TextStyle(
                            fontSize: 58,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(
                          width: 400,
                          child: Text(
                            "Bons Negócios, Praticidade e Confiança!",
                            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 400,
                          child: Text(
                            "Baixe já o APP e faça suas vendas a um bom preço, com confiança "
                            "e sem precisar sair de casa.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Versão 2.0.0+9 • Dezembro 2025',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        const SizedBox(height: 30),
                        _downloadButtons(),
                      ],
                    ),

                    // IMAGEM
                    FadeInRight(
                      duration: const Duration(milliseconds: 800),
                      delay: const Duration(milliseconds: 400),
                      child: SizedBox(
                        width: 300,
                        height: 500,
                        child: Image.asset(
                          "assets/icons/app/logo_transparent.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _downloadButtons() {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      delay: const Duration(milliseconds: 200),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          _DownloadButton(
            icon: Icons.android,
            label: 'Android',
            onPressed: () async {
              final Uri url = Uri.parse('https://idrpeixe.netlify.app/downloads/idr_peixe.apk');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
          ),
          const _DownloadButton(
            icon: Icons.apple,
            label: 'iOS',
            isDisabled: true,
          ),
        ],
      ),
    );
  }
}

class _DownloadButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const _DownloadButton({
    required this.icon,
    required this.label,
    this.onPressed,
    this.isDisabled = false,
  });

  @override
  State<_DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<_DownloadButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.isDisabled ? null : (_) => setState(() => _isHovering = true),
      onExit: widget.isDisabled ? null : (_) => setState(() => _isHovering = false),
      cursor: widget.isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovering && !widget.isDisabled ? -2 : 0, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isDisabled ? Colors.white60 : Colors.white,
            foregroundColor: widget.isDisabled ? Colors.grey : Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            elevation: widget.isDisabled ? 1 : (_isHovering ? 6 : 4),
            shadowColor: Colors.black26,
          ),
          onPressed: widget.isDisabled ? null : widget.onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 22),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
