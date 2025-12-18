import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenshotsCarousel extends StatefulWidget {
  const ScreenshotsCarousel({super.key});

  @override
  State<ScreenshotsCarousel> createState() => _ScreenshotsCarouselState();
}

class _ScreenshotsCarouselState extends State<ScreenshotsCarousel> {
  int _currentPage = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();
  final List<String> images = [
    "assets/images/screenshots/screenshot_1.png",
    "assets/images/screenshots/screenshot_2.png",
    "assets/images/screenshots/screenshot_3.png",
    "assets/images/screenshots/screenshot_4.png",
    "assets/images/screenshots/screenshot_5.png",
    "assets/images/screenshots/screenshot_6.png",
    "assets/images/screenshots/screenshot_7.png",
  ];

  @override
  Widget build(BuildContext context) {
    double carouselHeight;
    double viewportFraction;
    double enlargeFactor;
    double itemWidth;

    if (context.isSmallerThanSmallTablet) {
      // Small Tablets (481px - 768px)
      carouselHeight = 450;
      viewportFraction = 0.5;
      enlargeFactor = 0.2;
      itemWidth = context.screenWidth * 0.6;
    } else if (context.isTablet) {
      // Tablets (769px - 1279px)
      carouselHeight = 500;
      viewportFraction = 0.5;
      enlargeFactor = 0.2;
      itemWidth = 280;
    } else {
      // Desktop (1280px+)
      carouselHeight = 550;
      viewportFraction = 0.35;
      enlargeFactor = 0.25;
      itemWidth = 300;
    }

    return MaxWidthContainer(
      child: Column(
        children: [
          const AnimateOnScroll(
            uniqueKey: 'screenshots-title',
            child: Text(
              "Capturas de Tela",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const AnimateOnScroll(
            uniqueKey: 'screenshots-subtitle',
            delay: Duration(milliseconds: 100),
            child: Text(
              "Veja o IDR Peixe em ação",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 40),

          // CARROSSEL COM MÚLTIPLAS TELAS
          AnimateOnScroll(
            uniqueKey: 'screenshots-carousel',
            delay: const Duration(milliseconds: 200),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: itemWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(context.isMobile ? 0.15 : 0.3),
                            blurRadius: context.isMobile ? 15 : 25,
                            offset: context.isMobile ? const Offset(0, 8) : const Offset(0, 15),
                            spreadRadius: -5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: carouselHeight,
                    viewportFraction: viewportFraction,
                    enlargeCenterPage: true,
                    enlargeFactor: enlargeFactor,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOutCubic,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() => _currentPage = index);
                    },
                  ),
                ),

                // SETAS DE NAVEGAÇÃO
                if (!context.isSmallerThanSmallTablet) ...[
                  Positioned(
                    left: 20,
                    child: IconButton(
                      onPressed: () => _carouselController.previousPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      ),
                      icon: const Icon(Icons.arrow_back_ios_rounded, size: 36),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.all(16),
                        elevation: 4,
                        shadowColor: Colors.black26,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: IconButton(
                      onPressed: () => _carouselController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      ),
                      icon: const Icon(Icons.arrow_forward_ios_rounded, size: 36),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.all(16),
                        elevation: 4,
                        shadowColor: Colors.black26,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 30),

          // INDICADORES ANIMADOS
          AnimateOnScroll(
            uniqueKey: 'screenshots-indicators',
            delay: const Duration(milliseconds: 300),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentPage,
              count: images.length,
              effect: WormEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade300,
                spacing: 8,
              ),
              onDotClicked: (index) {
                _carouselController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
