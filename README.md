# IDR Peixe - Landing Page

Landing page moderna e responsiva para o aplicativo IDR Peixe, desenvolvida em Flutter Web.

## 🚀 Recursos Implementados

### ✨ Design & UX

- **Google Fonts (Poppins)** - Tipografia profissional e moderna
- **Animações suaves** - FadeIn e SlideUp usando `animate_do`
- **Hover effects** - Cards interativos com efeitos de elevação
- **Responsividade completa** - Design adaptado para mobile, tablet e desktop
- **Gradiente moderno** - Hero section com cores vibrantes

### 📱 Seções da Landing Page

1. **Hero Section** - Apresentação principal com CTA de download
2. **Stats Section** - Estatísticas impressionantes (downloads, usuários, etc.)
3. **Screenshots Carousel** - Carrossel automático de prints do app
4. **About Section** - Descrição detalhada do aplicativo
5. **Features Section** - Grid de recursos com ícones e animações
6. **Testimonials Section** - Depoimentos de usuários com avaliações
7. **FAQ Section** - Perguntas frequentes com expansão
8. **Install Section** - Instruções de instalação do APK
9. **Footer** - Rodapé com copyright

### 🎨 Melhorias de UI/UX

- **CTAs funcionais** - Botão de download com `url_launcher`
- **Cards com hover** - Efeitos visuais ao passar o mouse
- **Animações escalonadas** - Delays diferentes para cada card
- **Cores consistentes** - Paleta azul/verde profissional
- **Espaçamento otimizado** - Layout limpo e organizado

### 🔧 SEO & Performance

- **Meta tags otimizadas** - Título, descrição e keywords
- **Open Graph tags** - Compartilhamento otimizado em redes sociais
- **Twitter Cards** - Preview adequado no Twitter
- **Viewport configurado** - Para dispositivos móveis

## 📦 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  google_fonts: ^6.2.1      # Fontes customizadas
  url_launcher: ^6.3.1      # Abrir links externos
  animate_do: ^3.3.4        # Animações prontas
```

## 🛠️ Como usar

1. **Instalar dependências**:

   ```bash
   flutter pub get
   ```

2. **Rodar em modo web**:

   ```bash
   flutter run -d chrome
   ```

3. **Build para produção**:

   ```bash
   flutter build web
   ```

## ⚙️ Configurações Importantes

### Atualizar link do APK

No arquivo `lib/screens/home/home_screen.dart`, linha ~134:

```dart
final Uri url = Uri.parse('https://seu-link-do-apk.com/idr_peixe.apk');
```

### Personalizar estatísticas

No arquivo `lib/screens/home/home_screen.dart`, classe `StatsSection`:

- Altere os números (500+, 200+, etc.)
- Modifique os labels conforme necessário

### Adicionar/Editar depoimentos

Na classe `TestimonialsSection`, adicione novos `TestimonialCard`:

```dart
TestimonialCard(
  name: "Nome do Usuário",
  role: "Cargo/Profissão",
  comment: "Comentário aqui...",
  rating: 5, // 1 a 5 estrelas
),
```

### Modificar FAQ

Na classe `FAQSection`, adicione novos `FAQItem`:

```dart
FAQItem(
  question: "Sua pergunta?",
  answer: "Sua resposta detalhada...",
),
```

## 📱 Responsividade

A landing page adapta-se automaticamente a:

- **Mobile** (< 600px) - Layout em coluna única
- **Tablet** (600px - 900px) - Layout em 2 colunas
- **Desktop** (> 900px) - Layout completo em 3 colunas

## 📄 Licença

© 2025 - IDR Peixe | Todos os direitos reservados
