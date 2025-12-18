import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaxWidthContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isSmallerThanSmallTablet ? 24 : 80,
          ),
          child: const Column(
            children: [
              AnimateOnScroll(
                uniqueKey: 'about-title',
                child: Text(
                  "Sobre o IDR Peixe",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              AnimateOnScroll(
                uniqueKey: 'about-text',
                delay: Duration(milliseconds: 100),
                child: Text(
                  "O IDR Peixe é um aplicativo criado para facilitar o registro e o acompanhamento da produção aquícola, "
                  "além de aproximar produtores e compradores.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, height: 1.6),
                ),
              ),

              SizedBox(height: 50),

              // GRID DE IMAGENS DE PEIXES
              AnimateOnScroll(
                uniqueKey: 'about-images',
                delay: Duration(milliseconds: 200),
                child: Wrap(
                  alignment: WrapAlignment.center, // Alinhamento centralizado
                  spacing: 20, // Espaçamento horizontal
                  runSpacing: 20, // Espaçamento vertical
                  children: [
                    _FishImageCard(
                      imagePath: 'assets/images/fish/tambaqui-pacu-hibridos.JPG',
                      title: 'Tambaqui',
                    ),
                    _FishImageCard(
                      imagePath: 'assets/images/fish/tilapia.jpg',
                      title: 'Tilápia',
                    ),
                    _FishImageCard(
                      imagePath: 'assets/images/fish/pintado.jpeg',
                      title: 'Pintado',
                    ),
                    _FishImageCard(
                      imagePath: 'assets/images/fish/carpa.jpeg',
                      title: 'Carpa',
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

class _FishImageCard extends StatefulWidget {
  final String imagePath;
  final String title;

  const _FishImageCard({
    required this.imagePath,
    required this.title,
  });

  @override
  State<_FishImageCard> createState() => _FishImageCardState();
}

class _FishImageCardState extends State<_FishImageCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isSmallerThanSmallTablet = context.isSmallerThanSmallTablet;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovering ? -8 : 0, 0),
        width: isSmallerThanSmallTablet ? 150 : 300,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: _isHovering ? Colors.blue.withOpacity(0.3) : Colors.black12,
                      blurRadius: _isHovering ? 20 : 12,
                      offset: Offset(0, _isHovering ? 8 : 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: _isHovering ? FontWeight.bold : FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
