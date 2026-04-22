import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DemoVideoSection extends StatelessWidget {
  const DemoVideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isMobile = screenWidth < 900;

    return SizedBox(
      width: double.infinity,
      child: MaxWidthContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 50 : 80,
          ),
          child: Column(
            children: [
              // Título Principal
              AnimateOnScroll(
                uniqueKey: 'demo-video-title',
                child: Column(
                  children: [
                    const Text(
                      "Veja o IDR Peixe em Ação",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 34, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Conheça todas as funcionalidades do aplicativo",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Vídeo + Lista de Features
              isMobile
                  ? const Column(
                      children: [
                        _VideoContainer(),
                        SizedBox(height: 40),
                        _FeaturesList(),
                      ],
                    )
                  : const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Lista de Features (esquerda)
                        Expanded(
                          flex: 5,
                          child: _FeaturesList(),
                        ),
                        SizedBox(width: 40),
                        // Vídeo (direita)
                        Expanded(
                          flex: 6,
                          child: _VideoContainer(),
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

class _FeaturesList extends StatelessWidget {
  const _FeaturesList();

  @override
  Widget build(BuildContext context) {
    return AnimateOnScroll(
      uniqueKey: 'features-list',
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Principais Recursos",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 24),
          const _FeatureItem(
            icon: Icons.person_add,
            title: "Cadastro de produtores e compradores",
          ),
          const _FeatureItem(
            icon: Icons.phone,
            title: "Contato direto (telefone e WhatsApp)",
          ),
          const _FeatureItem(
            icon: Icons.map,
            title: "Marcação de propriedades no mapa",
          ),
          const _FeatureItem(
            icon: Icons.location_on,
            title: "Acesso com GPS às propriedades",
          ),
          const _FeatureItem(
            icon: Icons.filter_list,
            title: "Filtragem por espécies de peixes",
          ),
          const _FeatureItem(
            icon: Icons.inventory,
            title: "Gestão completa de lotes",
          ),
          const _FeatureItem(
            icon: Icons.business,
            title: "Cadastro de várias propriedades",
          ),
          const _FeatureItem(
            icon: Icons.bookmark,
            title: "Reserva de lotes para compradores",
          ),
          const _FeatureItem(
            icon: Icons.shopping_cart,
            title: "Venda parcial de lotes",
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _FeatureItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.blue.shade700,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoContainer extends StatefulWidget {
  const _VideoContainer();

  @override
  State<_VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<_VideoContainer> {
  static const String _demoVideoId = 'CYP9C2UY-FU';

  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: _demoVideoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateOnScroll(
      uniqueKey: 'demo-video-player',
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
