import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimateOnScroll extends StatefulWidget {
  final Widget child;
  final String uniqueKey;
  final Duration? duration;
  final Duration? delay;

  const AnimateOnScroll({
    super.key,
    required this.child,
    required this.uniqueKey,
    this.duration,
    this.delay,
  });

  @override
  State<AnimateOnScroll> createState() => _AnimateOnScrollState();
}

class _AnimateOnScrollState extends State<AnimateOnScroll> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.uniqueKey),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: _isVisible
          ? FadeInUp(
              duration: widget.duration ?? const Duration(milliseconds: 800),
              delay: widget.delay ?? Duration.zero,
              child: widget.child,
            )
          : Opacity(
              opacity: 0,
              child: widget.child,
            ),
    );
  }
}
