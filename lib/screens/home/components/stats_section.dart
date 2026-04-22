import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return SizedBox(
      width: double.infinity,
      child: MaxWidthContainer(
        child: AnimateOnScroll(
          uniqueKey: 'stats-section',
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth < 600 ? 24 : 80,
              vertical: 50,
            ),
            child: const Wrap(
              alignment: WrapAlignment.spaceAround, // Alinhamento espaçado
              crossAxisAlignment: WrapCrossAlignment.end, // Alinhamento vertical inferior
              spacing: 60, // Espaçamento horizontal
              runSpacing: 40, // Espaçamento vertical
              children: [
                StatItem(number: "100+", label: "Downloads"),
                StatItem(number: "100+", label: "Usuários Ativos"),
                StatItem(number: "100+", label: "Lotes Cadastrados"),
                StatItem(number: "5★", label: "Avaliação Média"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
