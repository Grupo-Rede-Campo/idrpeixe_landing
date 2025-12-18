import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallerThanSmallTablet = context.isSmallerThanSmallTablet;

    return Container(
      width: double.infinity,
      color: Colors.grey.shade50,
      child: MaxWidthContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallerThanSmallTablet ? 24 : 80,
            vertical: 50,
          ),
          child: Column(
            children: [
              AnimateOnScroll(
                uniqueKey: 'partners-title',
                child: Column(
                  children: [
                    const Text(
                      "Realização",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center, // Alinhamento centralizado
                      spacing: isSmallerThanSmallTablet ? 20 : 40, // Espaçamento horizontal
                      runSpacing: isSmallerThanSmallTablet ? 20 : 40, // Espaçamento vertical
                      children: const [
                        _PartnerLogo(imagePath: 'assets/icons/partners/rede_campo.png'),
                        _PartnerLogo(imagePath: 'assets/icons/partners/utfpr.png'),
                        _PartnerLogo(imagePath: 'assets/icons/partners/idr.png'),
                        _PartnerLogo(imagePath: 'assets/icons/partners/gov_pr.png'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              AnimateOnScroll(
                uniqueKey: 'partners-collaborators',
                delay: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    const Text(
                      "Apoio e Colaboração",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      alignment: WrapAlignment.center, // Alinhamento centralizado
                      spacing: isSmallerThanSmallTablet ? 20 : 40, // Espaçamento horizontal
                      runSpacing: isSmallerThanSmallTablet ? 20 : 40, // Espaçamento vertical
                      children: const [
                        _PartnerLogo(imagePath: 'assets/icons/partners/cnpq.png'),
                        _PartnerLogo(imagePath: 'assets/icons/partners/prefeitura_sh.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PartnerLogo extends StatefulWidget {
  final String imagePath;

  const _PartnerLogo({required this.imagePath});

  @override
  State<_PartnerLogo> createState() => _PartnerLogoState();
}

class _PartnerLogoState extends State<_PartnerLogo> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isSmallerThanSmallTablet = context.isSmallerThanSmallTablet;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovering ? -4 : 0, 0),
        width: isSmallerThanSmallTablet ? 150 : 200,
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: _isHovering ? Colors.blue.withOpacity(0.2) : Colors.black12,
                  blurRadius: _isHovering ? 16 : 8,
                  offset: Offset(0, _isHovering ? 4 : 2),
                )
              ],
            ),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
