import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/screens/home/components/about_section.dart';
import 'package:idrpeixe_landing/screens/home/components/cta_section.dart';
import 'package:idrpeixe_landing/screens/home/components/demo_video_section.dart';
import 'package:idrpeixe_landing/screens/home/components/faq_section.dart';
import 'package:idrpeixe_landing/screens/home/components/footer_section.dart';
import 'package:idrpeixe_landing/screens/home/components/hero_section.dart';
import 'package:idrpeixe_landing/screens/home/components/partners_section.dart';
import 'package:idrpeixe_landing/screens/home/components/screenshots_carousel.dart';
import 'package:idrpeixe_landing/screens/home/components/stats_section.dart';
import 'package:idrpeixe_landing/screens/home/components/testimonials_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(10, (_) => GlobalKey());

  static const List<Color> _backgroundPalette = [
    Color(0xFFDCEEFF),
    Color(0xFFD8F6E8),
    Color(0xFFE7F3FF),
    Color(0xFFE2F8ED),
  ];

  int _activeSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _handleScroll();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients || !mounted) {
      return;
    }

    final triggerGlobalY = MediaQuery.sizeOf(context).height * 0.35;
    var nextSectionIndex = 0;

    for (var index = 0; index < _sectionKeys.length; index++) {
      final sectionOffset = _sectionTopGlobal(sectionIndex: index);

      if (sectionOffset == null) {
        continue;
      }

      if (sectionOffset <= triggerGlobalY) {
        nextSectionIndex = index;
      } else {
        break;
      }
    }

    if (nextSectionIndex != _activeSectionIndex) {
      setState(() {
        _activeSectionIndex = nextSectionIndex;
      });
    }
  }

  double? _sectionTopGlobal({required int sectionIndex}) {
    final sectionContext = _sectionKeys[sectionIndex].currentContext;
    if (sectionContext == null) {
      return null;
    }

    final sectionRenderObject = sectionContext.findRenderObject();
    if (sectionRenderObject is! RenderBox || !sectionRenderObject.attached) {
      return null;
    }

    return sectionRenderObject.localToGlobal(Offset.zero).dy;
  }

  Widget _sectionAnchor({
    required int index,
    required Widget child,
  }) {
    return KeyedSubtree(
      key: _sectionKeys[index],
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final startColor = _backgroundPalette[_activeSectionIndex % _backgroundPalette.length];
    final endColor = _backgroundPalette[(_activeSectionIndex + 1) % _backgroundPalette.length];

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [startColor, endColor],
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _sectionAnchor(index: 0, child: const HeroSection()),
              _sectionAnchor(index: 1, child: const StatsSection()),
              const SizedBox(height: 60),
              _sectionAnchor(index: 2, child: const ScreenshotsCarousel()),
              const SizedBox(height: 60),
              _sectionAnchor(index: 3, child: const DemoVideoSection()),
              const SizedBox(height: 60),
              _sectionAnchor(index: 4, child: const AboutSection()),
              const SizedBox(height: 60),
              _sectionAnchor(index: 5, child: const TestimonialsSection()),
              const SizedBox(height: 60),
              _sectionAnchor(index: 6, child: const FAQSection()),
              const SizedBox(height: 60),
              _sectionAnchor(index: 7, child: const PartnersSection()),
              _sectionAnchor(index: 8, child: const CTASection()),
              _sectionAnchor(index: 9, child: const FooterSection()),
            ],
          ),
        ),
      ),
    );
  }
}
