import 'package:flutter/material.dart';
import 'package:idrpeixe_landing/core/ui/helpers/size_extensions.dart';
import 'package:idrpeixe_landing/core/ui/widgets/max_width_container.dart';
import 'package:idrpeixe_landing/screens/home/components/animate_on_scroll.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return MaxWidthContainer(
      child: Column(
        children: [
          const AnimateOnScroll(
            uniqueKey: 'faq-title',
            child: Text(
              "Perguntas Frequentes",
              style: TextStyle(fontSize: 34, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 20 : 80),
            child: const Column(
              children: [
                FAQItem(
                  question: "O app funciona offline?",
                  answer:
                      "Não! O IDR Peixe não funciona offline. Ele requer uma conexão com a internet para sincronizar os dados e acessar todos os recursos.",
                ),
                FAQItem(
                  question: "Posso usar em tablet?",
                  answer:
                      "Sim! O IDR Peixe é otimizado para funcionar em smartphones e tablets Android. A interface se adapta automaticamente ao tamanho da tela.",
                ),
                FAQItem(
                  question: "Como faço para cadastrar uma propriedade?",
                  answer:
                      "Após fazer login, acesse o menu principal e selecione 'Propriedades'. Toque no botão '+' e preencha as informações solicitadas, incluindo nome, localização no mapa e dados de contato.",
                ),
                FAQItem(
                  question: "Quantos lotes posso cadastrar?",
                  answer:
                      "Não há limite! Você pode cadastrar quantos lotes precisar para gerenciar toda sua produção em múltiplas propriedades.",
                ),
                FAQItem(
                  question: "O app é gratuito?",
                  answer: "Sim, o IDR Peixe é completamente gratuito com todos os recursos disponíveis.",
                ),
                FAQItem(
                  question: "Posso vender meus peixes pelo app?",
                  answer:
                      "Você pode anunciar seus peixes para venda dentro do aplicativo, conectando-se diretamente com compradores interessados na sua região.",
                ),
                FAQItem(
                  question: "Tem suporte técnico?",
                  answer:
                      "Sim! Nossa equipe oferece suporte via WhatsApp e email. Entre em contato através dos canais disponíveis no rodapé da página ou dentro do próprio aplicativo.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimateOnScroll(
      uniqueKey: 'faq-item-${widget.question}',
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              widget.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.blue,
            ),
            onExpansionChanged: (expanded) {
              setState(() => _isExpanded = expanded);
            },
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.answer,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
