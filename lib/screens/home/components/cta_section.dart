import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/core/utils/url_helpers.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallerThanSmallTablet = context.isSmallerThanSmallTablet;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A7FCB), Color(0xFF0A9A6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: MaxWidthContainer(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallerThanSmallTablet ? 24 : 80,
              vertical: isSmallerThanSmallTablet ? 50 : 80,
            ),
            child: _buildContent()),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        // TÍTULO E VERSÃO
        const AnimateOnScroll(
          uniqueKey: 'cta-title',
          child: Column(
            children: [
              Text(
                "Baixe o IDR Peixe",
                style: TextStyle(
                  fontSize: 34,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Versão 2.0.0+9 • Atualizado em dezembro de 2025",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Disponível para Android",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),

        // BOTÕES DE DOWNLOAD
        AnimateOnScroll(
          uniqueKey: 'cta-buttons',
          delay: const Duration(milliseconds: 100),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              _DownloadButton(
                icon: Icons.android,
                label: 'Baixar para Android',
                subtitle: 'APK Direto',
                color: Colors.green,
                onPressed: () => UrlHelpers.downloadApk('https://idrpeixe.netlify.app/downloads/idr_peixe.apk'),
              ),
              const _DownloadButton(
                icon: Icons.apple,
                label: 'iOS',
                subtitle: 'Em breve',
                color: Colors.grey,
                isDisabled: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),

        // VÍDEO TUTORIAL
        AnimateOnScroll(
          uniqueKey: 'cta-video',
          delay: const Duration(milliseconds: 150),
          child: Column(
            children: [
              const Text(
                "Veja como instalar",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Tutorial completo em vídeo",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 24),
              const _VideoPlayer(),
            ],
          ),
        ),
        const SizedBox(height: 50),

        // INSTRUÇÕES
        AnimateOnScroll(
          uniqueKey: 'cta-instructions',
          delay: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Passo a passo resumido",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _InstructionStep(number: "1", text: "Baixe o arquivo APK"),
                SizedBox(height: 12),
                _InstructionStep(number: "2", text: "Abra o arquivo baixado"),
                SizedBox(height: 12),
                _InstructionStep(number: "3", text: "Permita a instalação de fontes desconhecidas (se necessário)"),
                SizedBox(height: 12),
                _InstructionStep(number: "4", text: "Toque em Instalar e pronto!"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InstructionStep extends StatelessWidget {
  final String number;
  final String text;

  const _InstructionStep({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  const _VideoPlayer();

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  static const bool _isTutorialVideoAvailable = false;
  static const String _tutorialVideoId = 'dQw4w9WgXcQ';

  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (_isTutorialVideoAvailable) {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: _tutorialVideoId,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showFullscreenButton: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: _isTutorialVideoAvailable && _controller != null
              ? YoutubePlayer(
                  controller: _controller!,
                  aspectRatio: 16 / 9,
                )
              : Container(
                  color: const Color(0xFF0F172A),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.ondemand_video_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Em breve',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tutorial em video sera disponibilizado em breve.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _DownloadButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const _DownloadButton({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
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
        transform: Matrix4.translationValues(0, _isHovering && !widget.isDisabled ? -4 : 0, 0),
        child: ElevatedButton(
          onPressed: widget.isDisabled ? null : widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isDisabled ? Colors.grey.shade300 : widget.color,
            foregroundColor: widget.isDisabled ? Colors.grey.shade600 : Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            elevation: widget.isDisabled ? 0 : (_isHovering ? 8 : 4),
            shadowColor: widget.isDisabled ? Colors.transparent : Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: SizedBox(
            width: 200,
            height: 135,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, size: 48),
                const SizedBox(height: 12),
                Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.isDisabled ? Colors.grey.shade600 : Colors.white70,
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
