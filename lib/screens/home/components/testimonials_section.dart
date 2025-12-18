import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return MaxWidthContainer(
      child: Column(
        children: [
          const AnimateOnScroll(
            uniqueKey: 'testimonials-title',
            child: Text(
              "O que nossos usuários dizem",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 20 : 80),
              child: const Wrap(
                alignment: WrapAlignment.center, // Alinhamento centralizado
                runAlignment: WrapAlignment.center, // Alinhamento centralizado
                spacing: 20, // Espaçamento horizontal
                runSpacing: 20, // Espaçamento vertical
                children: [
                  TestimonialCard(
                    name: "Jõao da Silva",
                    comment: "O IDR Peixe facilitou a forma como gerencio minha produção. Economizo horas todos os dias!",
                    rating: 5,
                    delay: 100,
                    avatarUrl: '',
                  ),
                  TestimonialCard(
                    name: "Maria Oliveira",
                    comment: "Interface intuitiva e recursos completos. Recomendo para todos da área!",
                    rating: 4,
                    delay: 200,
                    avatarUrl: '',
                  ),
                  TestimonialCard(
                    name: "Carlos Pereira",
                    comment: "Muito bom! Facilita muito o controle e acompanhamento dos lotes.",
                    rating: 4,
                    delay: 300,
                    avatarUrl: '',
                  ),
                  TestimonialCard(
                    name: "Ana Souza",
                    comment: "Ótimo aplicativo! Ajudou-me a organizar melhor minha produção aquícola.",
                    rating: 5,
                    delay: 300,
                    avatarUrl: '',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String name;
  final String comment;
  final int rating;
  final int delay;
  final String? avatarUrl;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.comment,
    required this.rating,
    required this.delay,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return AnimateOnScroll(
      uniqueKey: 'testimonial-$name',
      delay: Duration(milliseconds: delay),
      child: Container(
        width: screenWidth < 900 ? double.infinity : 350,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FOTO DE PERFIL + NOME
            Row(
              children: [
                // Opção 1
                CachedNetworkImage(
                  imageUrl: avatarUrl ?? "",
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 30,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => const CircleAvatar(
                    radius: 30,
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      name[0],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ),

                //Opção 2: ClipOval
                /* 
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: avatarUrl ?? "",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(name[0]),
                    ),
                  ),
                ),
                */

                //Opção 3: CircleAvatar com CachedNetworkImageProvider
                /* 
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage: avatarUrl != null ? CachedNetworkImageProvider(avatarUrl!) : null,
                  child: avatarUrl == null
                      ? Text(
                          name[0],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        )
                      : null,
                ),
                 */

                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Dezembro 2025",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // ESTRELAS
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // COMENTÁRIO
            Text(
              comment,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
