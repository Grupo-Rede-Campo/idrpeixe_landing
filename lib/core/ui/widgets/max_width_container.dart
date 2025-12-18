import 'package:flutter/material.dart';

/// Wrapper que limita a largura máxima do conteúdo e centraliza
class MaxWidthContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  const MaxWidthContainer({
    super.key,
    required this.child,
    this.maxWidth = 1500,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padding != null
            ? Padding(
                padding: padding!,
                child: child,
              )
            : child,
      ),
    );
  }
}
