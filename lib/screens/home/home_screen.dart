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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            StatsSection(),
            SizedBox(height: 60),
            ScreenshotsCarousel(),
            SizedBox(height: 60),
            DemoVideoSection(),
            SizedBox(height: 60),
            AboutSection(),
            SizedBox(height: 60),
            TestimonialsSection(),
            SizedBox(height: 60),
            FAQSection(),
            SizedBox(height: 60),
            PartnersSection(),
            CTASection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
